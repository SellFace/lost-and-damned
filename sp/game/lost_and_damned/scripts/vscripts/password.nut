function GenerateCode()
{
	if ( SERVER_DLL )
	{
		local code = RandomInt(1000,9999); 
		Globals.AddGlobal("PASSWORD", "resident_evil_test", 1);
		local password_id = Globals.GetIndex("PASSWORD");
		if (Globals.GetCounter(password_id) == 0)
		{
			Globals.SetCounter(password_id, code);
			EntFire("monitor_code","SetMessage",""+code,0);
		}
		NetMsg.Start("Code");
		NetMsg.WriteShort(Globals.GetCounter(password_id));
		NetMsg.Send(player, true);
	}
}

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
		m_panel.SetPos( (ScreenWidth()/2)-256,(ScreenHeight()/2)-256 );
		m_panel.SetSize( 500, 500 );
		m_panel.SetMouseInputEnabled(true);
		m_panel.MakePopup();

		image = vgui.CreatePanel( "ImagePanel", m_panel, "ExampleImage" );
		image.MakeReadyForUse();
		image.SetSize( 512, 512 );
		image.SetPos( -50, 0 );
		image.SetAlpha( 255 );
		image.MoveToFront();
		image.SetImage("keypad", false);

		label = vgui.CreatePanel( "Label", image, "ExampleLabel" );
		label.MakeReadyForUse();
		label.SetPaintEnabled( true );
		label.SetPaintBackgroundEnabled( false );
		label.SetFgColor( 250, 250, 250, 255 );
		label.SetPos( 94*2.15, 35*2.15 );
		label.SetSize(m_panel.GetTall()/4, m_panel.GetTall()/9 );
		label.SetContentAlignment( Alignment.center );
		label.SetFont( 12 );
		label.SetText( "" );
		labeltext <- ""
		
		local button = vgui.CreatePanel( "Button", image, "ExampleButton" );
		button.SetPaintEnabled( true );
		button.SetPaintBorderEnabled( false );
		button.SetDepressedSound("click.wav");
		button.MoveToFront();
		button.SetPos( 77*2.15, 61*2.15 );
		button.SetSize(m_panel.GetTall()/8.5, m_panel.GetTall()/8.5 );
		button.SetCallback( "DoClick", DoClick.bindenv(this) );
		
		local button2 = vgui.CreatePanel( "Button", image, "ExampleButton" );
		button2.SetPaintEnabled( true );
		button2.SetPaintBorderEnabled( false );
		button2.SetDepressedSound("click.wav");
		button2.MoveToFront();
		button2.SetPos( 109*2.15, 61*2.15 );
		button2.SetSize(m_panel.GetTall()/8.5, m_panel.GetTall()/8.5 );
		button2.SetCallback( "DoClick", DoClick2.bindenv(this) );

		local button3 = vgui.CreatePanel( "Button", image, "ExampleButton" );
		button3.SetPaintEnabled( true );
		button3.SetPaintBorderEnabled( false );
		button3.SetDepressedSound("click.wav");
		button3.MoveToFront();
		button3.SetPos( 141*2.15, 61*2.15 );
		button3.SetSize(m_panel.GetTall()/8.5, m_panel.GetTall()/8.5 );
		button3.SetCallback( "DoClick", DoClick3.bindenv(this) );
		
		local button4 = vgui.CreatePanel( "Button", image, "ExampleButton" );
		button4.SetPaintEnabled( true );
		button4.SetPaintBorderEnabled( false );
		button4.SetDepressedSound("click.wav");
		button4.MoveToFront();
		button4.SetPos( 77*2.15, 93*2.15 );
		button4.SetSize(m_panel.GetTall()/8.5, m_panel.GetTall()/8.5 );
		button4.SetCallback( "DoClick", DoClick4.bindenv(this) );
		
		local button5 = vgui.CreatePanel( "Button", image, "ExampleButton" );
		button5.SetPaintEnabled( true );
		button5.SetPaintBorderEnabled( false );
		button5.SetDepressedSound("click.wav");
		button5.MoveToFront();
		button5.SetPos( 109*2.15, 93*2.15 );
		button5.SetSize(m_panel.GetTall()/8.5, m_panel.GetTall()/8.5 );
		button5.SetCallback( "DoClick", DoClick5.bindenv(this) );

		local button6 = vgui.CreatePanel( "Button", image, "ExampleButton" );
		button6.SetPaintEnabled( true );
		button6.SetPaintBorderEnabled( false );
		button6.SetDepressedSound("click.wav");
		button6.MoveToFront();
		button6.SetPos( 141*2.15, 93*2.15);
		button6.SetSize(m_panel.GetTall()/8.5, m_panel.GetTall()/8.5 );
		button6.SetCallback( "DoClick", DoClick6.bindenv(this) );
		
		local button7 = vgui.CreatePanel( "Button", image, "ExampleButton" );
		button7.SetPaintEnabled( true );
		button7.SetPaintBorderEnabled( false );
		button7.SetDepressedSound("click.wav");
		button7.MoveToFront();
		button7.SetPos( 77*2.15, 125*2.15 );
		button7.SetSize(m_panel.GetTall()/8.5, m_panel.GetTall()/8.5 );
		button7.SetCallback( "DoClick", DoClick7.bindenv(this) );
		
		local button8 = vgui.CreatePanel( "Button", image, "ExampleButton" );
		button8.SetPaintEnabled( true );
		button8.SetPaintBorderEnabled( false );
		button8.SetDepressedSound("click.wav");
		button8.MoveToFront();
		button8.SetPos( 109*2.15, 125*2.15 );
		button8.SetSize(m_panel.GetTall()/8.5, m_panel.GetTall()/8.5 );
		button8.SetCallback( "DoClick", DoClick8.bindenv(this) );

		local button9 = vgui.CreatePanel( "Button", image, "ExampleButton" );
		button9.SetPaintEnabled( true );
		button9.SetPaintBorderEnabled( false );
		button9.SetDepressedSound("click.wav");
		button9.MoveToFront();
		button9.SetPos( 141*2.15, 125*2.15 );
		button9.SetSize(m_panel.GetTall()/8.5, m_panel.GetTall()/8.5 );
		button9.SetCallback( "DoClick", DoClick9.bindenv(this) );
		
		local button0 = vgui.CreatePanel( "Button", image, "ExampleButton" );
		button0.SetPaintEnabled( true );
		button0.SetPaintBorderEnabled( false );
		button0.SetDepressedSound("click.wav");
		button0.MoveToFront();
		button0.SetPos( 109*2.15, 157*2.15 );
		button0.SetSize(m_panel.GetTall()/8.5, m_panel.GetTall()/8.5 );
		button0.SetCallback( "DoClick", DoClick0.bindenv(this) );
		
		local buttonclear = vgui.CreatePanel( "Button", image, "ExampleButton" );
		buttonclear.SetPaintEnabled( true );
		buttonclear.SetPaintBorderEnabled( false );
		buttonclear.SetDepressedSound("click.wav");
		buttonclear.MoveToFront();
		buttonclear.SetPos( 77*2.15, 157*2.15 );
		buttonclear.SetSize(m_panel.GetTall()/8.5, m_panel.GetTall()/8.5 );
		buttonclear.SetCallback( "DoClick", Clear.bindenv(this) );
		
		local cross = vgui.CreatePanel( "Label", image, "ExampleLabeel" );
		cross.MakeReadyForUse();
		cross.SetPaintEnabled( true );
		cross.SetPos( 208*2.15, 1*2.15 );
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
		close.SetPos( 204*2.15, 0 );
		close.SetSize(m_panel.GetTall()/17, m_panel.GetTall()/17 );
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
	
	function DoClick()
	{
		labeltext=labeltext+"1";
		label.SetText( labeltext );
		CheckCode(labeltext);
	}
	
	function DoClick2()
	{
		labeltext=labeltext+"2";
		label.SetText( labeltext );
		CheckCode(labeltext);
	}
	
	function DoClick3()
	{
		labeltext=labeltext+"3";
		label.SetText( labeltext );
		CheckCode(labeltext);
	}
	
	function DoClick4()
	{
		labeltext=labeltext+"4";
		label.SetText( labeltext );
		CheckCode(labeltext);
	}
	
	function DoClick5()
	{
		labeltext=labeltext+"5";
		label.SetText( labeltext );
		CheckCode(labeltext);
	}
	
	function DoClick6()
	{
		labeltext=labeltext+"6";
		label.SetText( labeltext );
		CheckCode(labeltext);
	}
	
	function DoClick7()
	{
		labeltext=labeltext+"7";
		label.SetText( labeltext );
		CheckCode(labeltext);
	}
	
	function DoClick8()
	{
		labeltext=labeltext+"8";
		label.SetText( labeltext );
		CheckCode(labeltext);
	}

	function DoClick9()
	{
		labeltext=labeltext+"9";
		label.SetText( labeltext );
		CheckCode(labeltext);
	}
	
	function DoClick0()
	{
		labeltext=labeltext+"0";
		label.SetText( labeltext );
		CheckCode(labeltext);
	}
	
	function Clear()
	{
		labeltext="";
		label.SetText( labeltext );
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
	
	NetMsg.Receive("OpenKeypad", function()
	{
		DisplayPanels();
	}.bindenv(this) );
	
	NetMsg.Receive("HideKeypad", function()
	{
		HidePanels();
	}.bindenv(this) );
}
if ( SERVER_DLL )
{
	PASSWORD <- null;
	PASSWORD = RandomInt(1000,9999); 
	
	NetMsg.Receive("wrong", function( player )
	{
		SendToConsole("play buttons/button8.wav");
		EntFire("password_entry_server","runscriptcode","Hideme()",1.0);
	} );
	NetMsg.Receive("RequestCode", function( player )
	{
		NetMsg.Start("TheCode");
		NetMsg.WriteShort(Globals.GetCounter(Globals.GetIndex("PASSWORD")));
		NetMsg.Send(player, true);
	} );
	NetMsg.Receive("correct", function( player )
	{
		SendToConsole("play hl1/fvox/bell.wav");
		EntFire("password_entry_server","runscriptcode","Hideme()",1.0);
		EntFire("disabled_useable_door24","setentityname","useable_door24",1.0);
		EntFire("useable_keypad","kill","",0);
	} );
	EntFire("password_entry_server","runscriptcode","GenerateCode();",1.0);

}
function Init()
{
	SendToConsole("script_execute_client password");
	SendToConsole("script_execute password");
}
}

Everything();
GenerateCode();

function Keypad()
{
	NetMsg.Start("OpenKeypad");
	NetMsg.Send(player, true);
}

Hooks.Add( this, "OnRestore", GenerateCode, "Password" );
function Hideme()
{
	NetMsg.Start("HideKeypad");
	NetMsg.Send(player, true);
}
Hooks.Add( this, "OnRestore", Everything, "Password" );