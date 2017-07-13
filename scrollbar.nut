/*
    editbox.nut
    
    creator:     Ice Flake
    developers:  Ice Flake
    for:         Ivy
    description: Editbox extensions
    license:     Unlicense
*/

Namespace("Ivy::Entity");

class Ivy.Entity.Scrollbar extends Ivy.Entity.Element
{
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
        return ::Ivy.Entity.Scrollbar(::GUIScrollbar(::VectorScreen(0, 0), size.Translate(), color));
    }
}
