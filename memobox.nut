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

    static function Create(position, size, color)
    {
        return ::Ivy.Entity.Memobox(::GUIMemobox(position.Translate(), size.Translate(), color));
    }
}
