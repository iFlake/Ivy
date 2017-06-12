/*
    search.nut
    
    creator:     Ice Flake
    developers:  Ice Flake
    for:         Ivy
    description: Entity searches
    license:     CLNS
*/

Namespace("Ivy::Search");

Namespace("Ivy::Internal::Cache::Players");
Namespace("Ivy::Internal::Cache::Elements");

Namespace("Ivy::Internal");


function Ivy::Search::FindPlayer(instance)
{
    if (::Ivy.Internal.Cache.Players.rawin(instance)) return ::Ivy.Internal.Cache.Players[instance];
    else
    {
        local cinstance = ::Ivy.Entity.Player(instance);

        ::Ivy.Internal.Cache.Players.rawset(instance.weakref(), cinstance.weakref());
        return cinstance;
    }
}

function Ivy::Search::FindElement(instance)
{
    if (::Ivy.Internal.Cache.Elements.rawin(instance)) return ::Ivy.Internal.Cache.Elements[instance];
    else
    {
        local cinstance = ::Ivy.Entity[::Ivy.Internal.ElementType(instance)](instance);

        ::Ivy.Internal.Cache.Elements.rawset(instance.weakref(), cinstance.weakref());
        return cinstance;
    }
}

function Ivy::Internal::ElementType(instance)
{
    switch (typeof instance)
    {
        case "GUIElement":        return "Element";
        
        case "GUIButton":         return "Button";
        case "GUICanvas":         return "Canvas";
        case "GUICheckbox":       return "Checkbox";
        case "GUIEditbox":        return "Editbox";
        case "GUILabel":          return "Label";
        case "GUIListbox":        return "Listbox";
        case "GUIMemobox":        return "Memobox";
        case "GUIProgressBar":    return "ProgressBar";
        case "GUIScrollbar":      return "Scrollbar";
        case "GUISprite":         return "Sprite";
        case "GUIWindow":         return "Window";
    }
}
