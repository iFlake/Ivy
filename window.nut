/*
    window.nut
    
    creator:     Ice Flake
    developers:  Ice Flake
    for:         Ivy
    description: Window extensions
    license:     Unlicense
*/

Namespace("Ivy::Entity");

class Ivy.Entity.Window extends Ivy.Entity.Element
{
    constructor (instance)
    {
        base.constructor(instance);
    }

    static function Create(size, color, text)
    {
        return ::Ivy.Entity.Window(::GUIWindow(::VectorScreen(0, 0), size, color, text));
    }
}
