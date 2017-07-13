/*
    sprite.nut
    
    creator:     Ice Flake
    developers:  Ice Flake
    for:         Ivy
    description: Sprite extensions
    license:     Unlicense
*/

Namespace("Ivy::Entity");

class Ivy.Entity.Sprite extends Ivy.Entity.Element
{
    constructor (instance)
    {
        base.constructor(instance);
    }

    static function Create(file, color)
    {
        return ::Ivy.Entity.Sprite(::GUISprite(file, ::VectorScreen(0, 0), color));
    }
}
