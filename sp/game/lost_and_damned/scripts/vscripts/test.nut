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
		m_panel.SetBgColor( 0, 0, 0, 120 );
		m_panel.SetPos( XRES(32), YRES(64) );
		m_panel.SetSize( ScreenWidth() - XRES(64), YRES(52) );
		m_panel.SetMouseInputEnabled(true);
		m_panel.MakePopup();

		image = vgui.CreatePanel( "AvatarImage", m_panel, "ExampleImage" );
		image.MakeReadyForUse();
		image.SetPaintEnabled( true );
		image.SetSize( YRES(32), YRES(32) );
		image.SetPos( XRES(8), (m_panel.GetTall() - image.GetTall())/2 );
		image.SetShouldScaleImage( false );
		// image.SetImage( "vgui/achievements/hl2_find_alllambdas", true );
		image.SetPlayerByIndex( 1, 0 );
		image.SetDefaultAvatar( "vgui/achievements/hl2_find_alllambdas" );

		label = vgui.CreatePanel( "Label", m_panel, "ExampleLabel" );
		label.MakeReadyForUse();
		label.SetPaintEnabled( true );
		label.SetPaintBackgroundEnabled( false );
		label.SetFgColor( 200, 200, 200, 255 );
		label.SetPos( image.GetXPos() + image.GetWide(), 0 );
		label.SetSize( m_panel.GetWide() - label.GetXPos(), m_panel.GetTall() );
		label.SetContentAlignment( Alignment.center );
		label.SetFont( surface.GetFont( "examplefont", true ) );
		label.SetText( "hello" );
		
		local button = vgui.CreatePanel( "Button", m_panel, "ExampleButton" );
		button.SetBgColor( 200, 200, 200, 255 );
		button.SetPaintEnabled( true );
		button.SetPaintBorderEnabled( false );
		button.SetVisible(true);
		button.DrawBox( 20, 200, 200, 155, 255, 200, 200, 155, false );
		button.SetPos( image.GetXPos() + image.GetWide(), 0 );
		button.SetSize((m_panel.GetWide() - label.GetXPos())/8, m_panel.GetTall()/5 );
		button.SetCallback( "DoClick", DoClick.bindenv(this) );
		
	}
	
	function DoClick()
	{
		label.SetText( "fuck you" );
		image.SetSize( YRES(64), YRES(64) );
		label.SetFgColor( 200, 20, 20, 255 );
		NetMsg.Start("killss");
		NetMsg.Send();
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
		name			= "Courier",
		tall			= 26,
		weight			= 500,
		antialias		= true,
		proportional	= true
	} );
	DisplayPanels();
	NetMsg.Reset();
}
if ( SERVER_DLL )
{
	NetMsg.Receive("killss", function( player )
	{
		EntFire("fuck_you","explode","0",1.0);
		local rjaka = 0
		while (rjaka < 10)
		{
			EntFire("fuck_you","explode","0",1.1);
			rjaka = rjaka + 1
		}
		SendToConsole("play vo/npc/barney/ba_laugh04.wav");
	} );
}