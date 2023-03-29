function Everything()
{
if ( CLIENT_DLL )
{
	m_panel <- null;
	label <- null;
	image <- null;
	
	function DisplayPanels()
	{
		if ( m_panel && m_panel.IsValid() )
			return;

		m_panel = vgui.CreatePanel( "Panel", vgui.GetClientDLLRootPanel(), "ExamplePanel" );
		m_panel.MakeReadyForUse();
		m_panel.SetPaintEnabled( true );
		m_panel.SetPaintBackgroundEnabled( true );
		m_panel.SetPaintBackgroundType( 2 );
		m_panel.SetBgColor( 0, 0, 0, 0 );
		m_panel.SetPos( (ScreenWidth()/2)-YRES(200),(ScreenHeight()/2)-YRES(200) );
		m_panel.SetSize( YRES(512), YRES(720) );
		m_panel.SetMouseInputEnabled(true);
		m_panel.MakePopup();

		image = vgui.CreatePanel( "ImagePanel", m_panel, "ExampleImage" );
		image.MakeReadyForUse();
		image.SetSize( YRES(1028), YRES(1028) );
		image.SetPos( -80, -50 );
		image.MoveToFront();
		image.SetImage("maze_map", false);
		
		local cross = vgui.CreatePanel( "Label", image, "ExampleLabeel" );
		cross.MakeReadyForUse();
		cross.SetPaintEnabled( true );
		cross.SetPos( YRES(408), YRES(27) );
		cross.SetPaintBackgroundEnabled( false );
		cross.SetFgColor( 150, 0, 0, 255 );
		cross.SetFont( 12 );
		cross.SetText( "X" );
		
		local close = vgui.CreatePanel( "Button", image, "ExampleButton" );
		close.SetPaintEnabled( true );
		close.SetPaintBorderEnabled( true );
		close.SetText("");
		close.SetContentAlignment(4);
		close.SetDefaultColor( 200, 0, 0, 255, 0, 0,0,0 );
		close.SetPos( YRES(404), YRES(25) );
		close.SetSize(YRES(16), YRES(16) );
		close.SetCallback( "DoClick", Close.bindenv(this) );
		
	}
	NetMsg.Receive("Code", function()
	{
		correct_code <- NetMsg.ReadShort()
	}.bindenv(this) );
	function CheckCode( labeltext )
	{
		NetMsg.Start("RequestCode");
		NetMsg.Send();
		NetMsg.Receive("TheCode", function()
		{
			correct_code <- NetMsg.ReadShort()
		}.bindenv(this) );
		if (labeltext.len()>3)
		{
		
			if (labeltext==""+correct_code)
			{
				NetMsg.Start("correct");
				label.SetFgColor( 0, 250, 0, 255 );
				label.SetText("CORRECT");
				NetMsg.Send();
			}
			else
			{
				NetMsg.Start("wrong");
				label.SetFgColor( 250, 0, 0, 255 );
				label.SetText("WRONG");
				NetMsg.Send();
			}
		}
	}
	
	function Close()
	{
		HidePanels()
	}
	
	function HidePanels()
	{
		if ( m_panel && m_panel.IsValid() )
		{
			m_panel.Destroy();
			m_panel = null;
		}
	}

	surface.CreateFont( "examplefont",
	{
		name			= "Arial Black",
		tall			= 14,
		weight			= 400,
		antialias		= true,
		proportional	= false
	} );
	//DisplayPanels();
	
	NetMsg.Receive("OpenMap", function()
	{
		DisplayPanels();
	}.bindenv(this) );
	
	NetMsg.Receive("HideMap", function()
	{
		HidePanels();
	}.bindenv(this) );
}
function Init()
{
	SendToConsole("script_execute_client password");
	SendToConsole("script_execute password");
}
}

Everything();

function Map()
{
	NetMsg.Start("OpenMap");
	NetMsg.Send(player, true);
}

function Hideme()
{
	NetMsg.Start("HideMap");
	NetMsg.Send(player, true);
}
Hooks.Add( this, "OnRestore", Everything, "Password" );