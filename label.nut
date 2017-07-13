/*
    editbox.nut
    
    creator:     Ice Flake
    developers:  Ice Flake
    for:         Ivy
    description: Editbox extensions
    license:     Unlicense
*/

Namespace("Ivy::Entity");

class Ivy.Entity.Label extends Ivy.Entity.Element
{
    constructor (instance)
    {
        base.constructor(instance);
    }

    static function Create(color)
    {
        return ::Ivy.Entity.Label(::GUILabel(::VectorScreen(0, 0), color));
    }
}
