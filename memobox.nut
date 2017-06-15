/*
    editbox.nut
    
    creator:     Ice Flake
    developers:  Ice Flake
    for:         Ivy
    description: Editbox extensions
    license:     CLNS
*/

Namespace("Ivy::Entity");

class Ivy.Entity.Memobox extends Ivy.Entity.Element
{
    constructor (instance)
    {
        base.constructor(instance);
    }

    static function Create(size, color)
    {
        return ::Ivy.Entity.Memobox(::GUIMemobox(::VectorScreen(0, 0), size.Translate(), color));
    }
}
