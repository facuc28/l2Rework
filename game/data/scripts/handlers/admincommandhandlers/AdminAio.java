/*
 * Copyright (C) 2004-2013 L2J DataPack
 * 
 * This file is part of L2J DataPack.
 * 
 * L2J DataPack is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * L2J DataPack is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */
package handlers.admincommandhandlers;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.StringTokenizer;
import java.util.logging.Level;
import java.util.logging.Logger;

import l2r.Config;
import l2r.L2DatabaseFactory;
import l2r.gameserver.data.xml.impl.SkillData;
import l2r.gameserver.handler.IAdminCommandHandler;
import l2r.gameserver.model.L2Object;
import l2r.gameserver.model.L2World;
import l2r.gameserver.model.skills.L2Skill;
import l2r.gameserver.model.actor.instance.L2PcInstance;
import l2r.gameserver.network.clientpackets.Say2;
import l2r.gameserver.network.serverpackets.CreatureSay;
import l2r.gameserver.network.serverpackets.EtcStatusUpdate;

/**
 * Give / Take Status Aio to Player
 * Changes name color and title color if enabled
 *
 * Uses:
 * setaio [<player_name>] [<time_duration in days>]
 * removeaio [<player_name>]
 *
 * If <player_name> is not specified, the current target player is used.
 *
 *
 * @author KhayrusS
 *
 */
public class AdminAio implements IAdminCommandHandler
{
        private static String[] _adminCommands = { "admin_setaio", "admin_removeaio" };
        private final static Logger _log = Logger.getLogger(AdminAio.class.getName());

        public boolean useAdminCommand(String command, L2PcInstance activeChar)
        {
                        /*if (!Config.ALT_PRIVILEGES_ADMIN)
                                        if (!(checkLevel(activeChar.getAccessLevel()) && activeChar.isGM()))
                                        {
                                                        GmListTable.broadcastMessageToGMs("Player "+activeChar.getName()+ " tryed illegal action set Aio stat");
                                                        return false;
                                        }*/

                        if (command.startsWith("admin_setaio"))
                        {
                                        StringTokenizer str = new StringTokenizer(command);
                                        L2Object target = activeChar.getTarget();

                                        L2PcInstance player = null;

                                        if (target != null && target instanceof L2PcInstance)
                                                        player = (L2PcInstance)target;
                                        else
                                                        player = activeChar;

                                        try
                                        {
                                                        str.nextToken();
                                                        String time = str.nextToken();
                                                        if (str.hasMoreTokens())
                                                        {
                                                                        String playername = time;
                                                                        time = str.nextToken();
                                                                        player = L2World.getInstance().getPlayer(playername);
                                                                        doAio(activeChar, player, playername, time);
                                                        }
                                                        else
                                                        {
                                                                        String playername = player.getName();
                                                                        doAio(activeChar, player, playername, time);
                                                        }
                                                        if(!time.equals("0"));
                                        }
                                        catch(Exception e)
                                        {
                                                        activeChar.sendMessage("Usage: //setaio <char_name> [time](in days)");
                                        }

                                        player.broadcastUserInfo();
                                        if(player.isAio())
                                                        return true;
                        }
                        else if(command.startsWith("admin_removeaio"))
                        {
                                        StringTokenizer str = new StringTokenizer(command);
                                        L2Object target = activeChar.getTarget();

                                        L2PcInstance player = null;

                                        if (target != null && target instanceof L2PcInstance)
                                                        player = (L2PcInstance)target;
                                        else
                                                        player = activeChar;

                                        try
                                        {
                                                        str.nextToken();
                                                        if (str.hasMoreTokens())
                                                        {
                                                                        String playername = str.nextToken();
                                                                        player = L2World.getInstance().getPlayer(playername);
                                                                        removeAio(activeChar, player, playername);
                                                        }
                                                        else
                                                        {
                                                                        String playername = player.getName();
                                                                        removeAio(activeChar, player, playername);
                                                        }
                                        }
                                        catch(Exception e)
                                        {
                                                        activeChar.sendMessage("Usage: //removeaio <char_name>");
                                        }
										
                                        player.broadcastUserInfo();
                                        if(!player.isAio())
                                                        return true;
                        }
                        return false;
        }

        public void doAio(L2PcInstance activeChar, L2PcInstance _player, String _playername, String _time)
        {
                        int days = Integer.parseInt(_time);
                        if (_player == null)
                        {
                                        activeChar.sendMessage("not found char" + _playername);
                                        return;
                        }

                        if(days > 0)
                        {	
										_player.getStat().addExp(_player.getStat().getExpForLevel(81));
										L2Skill skill = SkillData.getInstance().getInfo(2025, 1);
										_player.doCast(skill);
										_player.setAio(true);
										_player.setEndTime("aio", days);
										_player.sendPacket(new CreatureSay(0,Say2.HERO_VOICE,"Infor","Dear player, you are now an AIO, Congratulations."));

                                        Connection connection = null;
                                        try
                                        {
                                                        connection = L2DatabaseFactory.getInstance().getConnection();

                                                        PreparedStatement statement = connection.prepareStatement("UPDATE characters SET aio=1, aio_end=? WHERE charId=?");
                                                        statement.setLong(1, _player.getAioEndTime());
                                                        statement.setInt(2, _player.getObjectId());
                                                        statement.execute();
                                                        statement.close();
                                                        connection.close();

                                                        if(Config.ALLOW_AIO_NCOLOR && _player.isAio())
														_player.getAppearance().setNameColor(Config.AIO_NCOLOR);

														if(Config.ALLOW_AIO_TCOLOR && _player.isAio())
														_player.getAppearance().setTitleColor(Config.AIO_TCOLOR);

                                                        _player.rewardAioSkills();
														
                                                        if(Config.ALLOW_AIO_ITEM && _player.isAio())
										{
														_player.getInventory().addItem("", Config.AIO_ITEMID, 1, _player, null);
														_player.getInventory().equipItem(_player.getInventory().getItemByItemId(Config.AIO_ITEMID));
                                      
										}
														_player.broadcastUserInfo();
														_player.sendSkillList();
														activeChar.sendMessage("GM "+ activeChar.getName()+ " set an AIO status for player "+ _playername + " for " + _time + " day(s)");
                                        }
                                        catch (Exception e)
                                        {
                                                        _log.log(Level.WARNING,"Could not set Aio stats to char:", e);
                                        }
                                        finally
                                        {
                                                        try {
                                                                        connection.close();
                                                        } catch (SQLException e) {
                                                                        // TODO Auto-generated catch block
                                                                        e.printStackTrace();
                                                        }
                                        }
                        }
                        else
                        {
                                        removeAio(activeChar, _player, _playername);
                        }
        }

        public void removeAio(L2PcInstance activeChar, L2PcInstance _player, String _playername)
        {
                        _player.setAio(false);
                        _player.setAioEndTime(0);

                        Connection connection = null;
                        try
                        {
                                        connection = L2DatabaseFactory.getInstance().getConnection();

                                        PreparedStatement statement = connection.prepareStatement("UPDATE characters SET aio=0, aio_end=0 WHERE charId=?");
                                        statement.setInt(1, _player.getObjectId());
                                        statement.execute();
                                        statement.close();
                                        connection.close();

                                        _player.lostAioSkills();
                                        if(Config.ALLOW_AIO_ITEM && activeChar.isAio() == false)
                                        _player.getInventory().destroyItemByItemId("", Config.AIO_ITEMID, 1, _player, null);
                                        _player.getWarehouse().destroyItemByItemId("", Config.AIO_ITEMID, 1, _player, null);
                                        _player.getAppearance().setNameColor(0xFFFFFF);
                                        _player.getAppearance().setTitleColor(0xFFFFFF);
                                        _player.broadcastUserInfo();
                                        _player.sendPacket(new EtcStatusUpdate(_player));
                                        _player.sendSkillList();
										activeChar.sendMessage("GM "+activeChar.getName()+" removed Aio status of player "+ _playername);
                        }
                        catch (Exception e)
                        {
                                        _log.log(Level.WARNING,"Could not remove Aio stats of char:", e);
                        }
                        finally
                        {
                                        try {
                                                        connection.close();
                                        } catch (SQLException e) {
                                                        // TODO Auto-generated catch block
                                                        e.printStackTrace();
                                        }
                        }
        }
       
        public String[] getAdminCommandList()
        {
                        return _adminCommands;
        }
}