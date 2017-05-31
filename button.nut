/*
    button.nut
    
    creator:     Ice Flake
    developers:  Ice Flake
    for:         Ivy
    description: Button extensions
    license:     CLNS
*/

Namespace("Ivy::Entity");

class Ivy.Entity.Button extends Ivy.Entity.Element
{
    constructor (instance)
    {
        base.constructor(instance);

        this.RegisterEvents({ });
    }

    static function Create(size, color, text)
    {
        return ::Ivy.Entity.Button(::GUIButton(::VectorScreen(0, 0), size.Translate(), color, text));
    }
}
