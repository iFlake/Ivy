/*
    editbox.nut
    
    creator:     Ice Flake
    developers:  Ice Flake
    for:         Ivy
    description: Editbox extensions
    license:     CLNS
*/

Namespace("Ivy::Entity");

class Ivy.Entity.Editbox extends Ivy.Entity.Element
{
    constructor (instance)
    {
        base.constructor(instance);

        this.RegisterEvents(
        {
            Return    = ::Ivy.Signal()
        });
    }

    static function Create(position, size, color)
    {
        return ::Ivy.Entity.Editbox(::GUIEditbox(position.Translate(), size.Translate(), color));
    }
}
