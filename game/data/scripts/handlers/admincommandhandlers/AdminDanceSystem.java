package handlers.admincommandhandlers;

import l2r.gameserver.ThreadPoolManager;
import l2r.gameserver.handler.IAdminCommandHandler;
import l2r.gameserver.model.L2World;
import l2r.gameserver.model.actor.instance.L2PcInstance;
import l2r.gameserver.model.effects.AbnormalEffect;
import l2r.gameserver.network.serverpackets.ExShowScreenMessage;
import l2r.gameserver.network.serverpackets.PlaySound;

/**
 *
 * @author  NeverMore Adapeter By Gandalf
 */
	public class AdminDanceSystem implements IAdminCommandHandler
	{
	boolean _temp = false;
 
	private static final String[] ADMIN_COMMANDS = { "admin_dance" , "admin_gangnam", "admin_sexi"};
 
	@Override
	public boolean useAdminCommand(String command, L2PcInstance activeChar)
	{
	if (command.equals("admin_dance"))
	{ 
	AdminHtml.showAdminHtml(activeChar, "dancesystem.htm");
	}     
 
	if (command.equals("admin_gangnam"))
	{ 
	if (_temp == true)
	{
	ExShowScreenMessage message1 = new ExShowScreenMessage("There is already a dancing event running! Try later!", 4000); 
	activeChar.sendPacket(message1);
	return false;
	}
	_temp = true;
	ExShowScreenMessage message1 = new ExShowScreenMessage("Lets have some fun ! In 30 sec's dance event begins !", 4000);
	activeChar.sendPacket(message1);
          ThreadPoolManager.getInstance().scheduleGeneral(new Runnable()
          {
          @Override
          public void run()
          {
          try
                          {
          for (L2PcInstance onlinePlayer : L2World.getInstance().getPlayers())
          {
          PlaySound _song = new PlaySound(1, "Gangnam", 0, 0, 0, 0, 0);
          onlinePlayer.sendPacket(_song);
		  ExShowScreenMessage message1 = new ExShowScreenMessage( "Show me what you got , lets shake it baby !", 8000);
          onlinePlayer.sendPacket(message1);
          onlinePlayer.setIsParalyzed(true);
          onlinePlayer.setIsInvul(true);
          onlinePlayer.broadcastSocialAction(10);
          ThreadPoolManager.getInstance().scheduleGeneral(new MyTask(), 3500);
          ThreadPoolManager.getInstance().scheduleGeneral(new MyTask2(), 40000);
          }
                          }
          catch (Exception e)
          {
          }
          }
          }, (30000));
	}     

	if (command.equals("admin_sexi"))
	{ 
	if (_temp == true)
	{
	ExShowScreenMessage message1 = new ExShowScreenMessage("There is already a dancing event running! Try later!", 4000); 
	activeChar.sendPacket(message1);
	return false;
	}
                  _temp = true;
	ExShowScreenMessage message1 = new ExShowScreenMessage("Lets have some fun ! In 30 sec's dance event begins !", 4000);
	activeChar.sendPacket(message1);
          ThreadPoolManager.getInstance().scheduleGeneral(new Runnable()
          {
                  @Override
                  public void run()
                  {
                          try
                  {
                  for (L2PcInstance onlinePlayer : L2World.getInstance().getPlayers())
                  {
                  PlaySound _song = new PlaySound(1, "sexi", 0, 0, 0, 0, 0);
                  onlinePlayer.sendPacket(_song);
                  ExShowScreenMessage message1 = new ExShowScreenMessage( "Show me what you got , lets shake it baby !", 8000);
                  onlinePlayer.sendPacket(message1);
                  onlinePlayer.setIsParalyzed(true);
                  onlinePlayer.setIsInvul(true);
                  onlinePlayer.broadcastSocialAction(10);
                  ThreadPoolManager.getInstance().scheduleGeneral(new MyTask(), 3500);
                  ThreadPoolManager.getInstance().scheduleGeneral(new MyTask2(), 43000);
                                  }
                          }
                          catch (Exception e)
                          {
                          }
                  }
          }, (30000)); 
	}     

	return false;
	}
 
	class MyTask implements Runnable
	{
        @Override
	public void run()
        {
         if(_temp == true)
         {
         for (L2PcInstance onlinePlayer : L2World.getInstance().getPlayers())
         {
         onlinePlayer.broadcastSocialAction(18);
         }
         ThreadPoolManager.getInstance().scheduleGeneral(new MyTask(), 18000);
         }
        }
	}
	class MyTask2 implements Runnable
	{

        @Override
	public void run()
        {
        for (L2PcInstance onlinePlayer : L2World.getInstance().getPlayers())
        {
        _temp = false;
		onlinePlayer.setIsParalyzed(false);
		onlinePlayer.setIsInvul(false);
        onlinePlayer.broadcastSocialAction(10);
        onlinePlayer.broadcastSocialAction(11);
        onlinePlayer.stopAbnormalEffect(AbnormalEffect.MAGIC_CIRCLE);
        }
        }
	}

	@Override
	public String[] getAdminCommandList()
          {
                          return ADMIN_COMMANDS;
          }
}