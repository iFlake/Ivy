/*
    editbox.nut
    
    creator:     Ice Flake
    developers:  Ice Flake
    for:         Ivy
    description: Editbox extensions
    license:     Unlicense
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

    static function Create(size, color)
    {
        return ::Ivy.Entity.Editbox(::GUIEditbox(::VectorScreen(0, 0), size.Translate(), color));
    }
}
