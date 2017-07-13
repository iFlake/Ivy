/*
    clientmanager.nut
    
    creator:     Ice Flake
    developers:  Ice Flake
    for:         Ivy
    description: Client manager
    license:     Unlicense
*/

Namespace("Ivy");

class Ivy.ClientManager
{
    On    = null;

    constructor ()
    {
        this.On    =
        {
            ScriptLoad          = ::Ivy.Signal(),
            ScriptUnload        = ::Ivy.Signal(),
            ScriptProcess       = ::Ivy.Signal(),

            PlayerDeath         = ::Ivy.Signal(),
            PlayerShoot         = ::Ivy.Signal(),

            ServerData          = ::Ivy.Signal(),

            ElementFocus        = ::Ivy.Signal(),
            ElementBlur         = ::Ivy.Signal(),
            ElementHoverOver    = ::Ivy.Signal(),
            ElementHoverOut     = ::Ivy.Signal(),
            ElementClick        = ::Ivy.Signal(),
            ElementRelease      = ::Ivy.Signal(),
            ElementDrag         = ::Ivy.Signal(),
            CheckboxToggle      = ::Ivy.Signal(),
            WindowClose         = ::Ivy.Signal(),
            InputReturn         = ::Ivy.Signal(),
            ListboxSelect       = ::Ivy.Signal(),
            ScrollbarScroll     = ::Ivy.Signal(),
            WindowResize        = ::Ivy.Signal(),

            GameResize          = ::Ivy.Signal(),
            KeyPressed          = ::Ivy.Signal(),
            KeyDown             = ::Ivy.Signal(),
            KeyUp               = ::Ivy.Signal()
        };
    }

    function HandleScriptLoad() this.On.ScriptLoad.Emit();
    function HandleScriptUnload() this.On.ScriptUnload.Emit();
    function HandleScriptProcess() this.On.ScriptProcess.Emit();

    function HandlePlayerDeath(player)
    {
        local iplayer = ::Ivy.Search.FindPlayer(player);

        iplayer.On.Death.Emit();
        this.On.PlayerDeath.Emit(iplayer);
    }
    function HandlePlayerShoot(player, weapon, hitentity, hitposition)
    {
        local iplayer = ::Ivy.Search.FindPlayer(player);

        iplayer.On.Shoot.Emit(weapon, hitentity, hitposition);
        this.On.PlayerShoot.Emit(iplayer, weapon, hitentity, hitposition)
    }

    function HandleServerData(stream) this.On.ServerData.Emit();

    function HandleElementFocus(element)
    {
        local ielement = ::Ivy.Search.FindElement(element);

        ielement.On.Focus.Emit();
        this.On.ElementFocus.Emit(ielement);
    }
    function HandleElementBlur(element)
    {
        local ielement = ::Ivy.Search.FindElement(element);

        ielement.On.Blur.Emit();
        this.On.ElementBlur.Emit(ielement);
    }
    function HandleElementHoverOver(element)
    {
        local ielement = ::Ivy.Search.FindElement(element);

        ielement.On.HoverOver.Emit();
        this.On.ElementHoverOver.Emit(ielement);
    }
    function HandleElementHoverOver(element)
    {
        local ielement = ::Ivy.Search.FindElement(element);

        ielement.On.HoverOut.Emit();
        this.On.ElementHoverOut.Emit(ielement);
    }
    function HandleElementClick(element, mousex, mousey)
    {
        local ielement = ::Ivy.Search.FindElement(element);

        ielement.On.Click.Emit(::Ivy.Vector2(mousex, mousey));
        this.On.ElementClick.Emit(ielement, ::Ivy.Vector2(mousex, mousey, false));
    }
    function HandleElementRelease(element, mousex, mousey)
    {
        local ielement = ::Ivy.Search.FindElement(element);

        ielement.On.Release.Emit(::Ivy.Vector2(mousex, mousey));
        this.On.ElementRelease.Emit(ielement, ::Ivy.Vector2(mousex, mousey, false));
    }
    function HandleElementDrag(element, mousex, mousey)
    {
        local ielement = ::Ivy.Search.FindElement(element);

        ielement.On.Drag.Emit(mousex, mousey);
        this.On.ElementDrag.Emit(ielement, mousex, mousey, false);
    }
    function HandleCheckboxToggle(element, toggle)
    {
        local ielement = ::Ivy.Search.FindElement(element);

        ielement.On.Toggle.Emit(toggle);
        this.On.CheckboxToggle.Emit(element, toggle);
    }
    function HandleWindowClose(element)
    {
        local ielement = ::Ivy.Search.FindElement(element);

        ielement.On.Close.Emit();
        this.On.WindowClose.Emit(element);
    }
    function HandleInputReturn(element)
    {
        local ielement = ::Ivy.Search.FindElement(element);

        ielement.On.Return.Emit();
        this.On.InputReturn.Emit(element);
    }
    function HandleListboxSelect(element, text)
    {
        local ielement = ::Ivy.Search.FindElement(element);

        ielement.On.Select.Emit(text);
        this.On.ListboxSelect.Emit(ielement, text);
    }
    function HandleScrollbarScroll(element, position, change)
    {
        local ielement = ::Ivy.Search.FindElement(element);

        ielement.On.Scroll.Emit(position, change);
        this.On.ElementScroll.Emit(element, position, change);
    }
    function HandleWindowResize(element, width, height)
    {
        local ielement = ::Ivy.Search.FindElement(element);

        ielement.On.Resize.Emit(::Ivy.Vector2(width, height));
        this.On.WindowResize.Emit(element, ::Ivy.Vector2(width, height, false));
    }

    function HandleGameResize(width, height) this.On.GameResize.Emit(::Ivy.Vector2(width, height, false));

    function Register()
    {
        Script.ScriptLoad       <- this.HandleScriptLoad.bindenv(this);
        Script.ScriptUnload     <- this.HandleScriptLoad.bindenv(this);
        Script.ScriptProcess    <- this.HandleScriptProcess.bindenv(this);
        
        Player.PlayerDeath      <- this.HandlePlayerDeath.bindenv(this);
        Player.PlayerShoot      <- this.HandlePlayerShoot.bindenv(this);

        Server.ServerData       <- this.HandleServerData.bindenv(this);

        GUI.ElementFocus        <- this.HandleElementFocus.bindenv(this);
        GUI.ElementBlur         <- this.HandleElementBlur.bindenv(this);
        GUI.ElementHoverOver    <- this.HandleElementHoverOver.bindenv(this);
        GUI.ElementHoverOut     <- this.HandleElementHoverOut.bindenv(this);
        GUI.ElementClick        <- this.HandleElementClick.bindenv(this);
        GUI.ElementRelease      <- this.HandleElementRelease.bindenv(this);
        GUI.ElementDrag         <- this.HandleElementDrag.bindenv(this);
        GUI.CheckboxToggle      <- this.HandleCheckboxToggle.bindenv(this);
        GUI.WindowClose         <- this.HandleWindowClose.bindenv(this);
        GUI.InputReturn         <- this.HandleInputReturn.bindenv(this);
        GUI.ListboxSelect       <- this.HandleListboxSelect.bindenv(this);
        GUI.ScrollbarScroll     <- this.HandleScrollbarScroll.bindenv(this);
        GUI.WindowResize        <- this.HandleWindowResize.bindenv(this);
        GUI.GameResize          <- this.HandleGameResize.bindenv(this);
    }
}
