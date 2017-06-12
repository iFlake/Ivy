/*
    editbox.nut
    
    creator:     Ice Flake
    developers:  Ice Flake
    for:         Ivy
    description: Editbox extensions
    license:     CLNS
*/

Namespace("Ivy::Entity");

class Ivy.Entity.Scrollbar extends Ivy.Entity.Element
{
    Position    = null;
    Size        = null;

    constructor (instance)
    {
        base.constructor(instance);

        this.RegisterEvents(
        {
            Scroll    = ::Ivy.Signal()
        });
    }

    static function Create(position, size, color)
    {
        local scrollbar = ::Ivy.Entity.Scrollbar(::GUIScrollbar(position.Translate(), size.Translate(), color));

        scrollbar.Position    = position;
        scrollbar.Size        = size;

        return scrollbar;
    }
}
