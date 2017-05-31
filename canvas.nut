/*
    canvas.nut
    
    creator:     Ice Flake
    developers:  Ice Flake
    for:         Ivy
    description: Canvas extensions
    license:     CLNS
*/

Namespace("Ivy::Entity");

class Ivy.Entity.Canvas extends Ivy.Entity.Element
{
    constructor (instance)
    {
        base.constructor(instance);

        this.RegisterEvents({ });
    }

    static function Create()
    {
        return ::Ivy.Entity.Canvas(::GUICanvas());
    }
}
