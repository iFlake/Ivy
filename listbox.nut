/*
    editbox.nut
    
    creator:     Ice Flake
    developers:  Ice Flake
    for:         Ivy
    description: Editbox extensions
    license:     CLNS
*/

Namespace("Ivy::Entity");

class Ivy.Entity.Listbox extends Ivy.Entity.Element
{
    constructor (instance)
    {
        base.constructor(instance);

        this.RegisterEvents(
        {
            Select    = ::Ivy.Signal()
        });
    }

    static function Create(position, size, color, selectedcolor)
    {
        return ::Ivy.Entity.Listbox(::GUIListbox(position.Translate(), size.Translate(), color, selectedcolor));
    }
}
