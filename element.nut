/*
    element.nut
    
    creator:     Ice Flake
    developers:  Ice Flake
    for:         Ivy
    description: Element extensions
    license:     CLNS
*/

Namespace("Ivy::Entity");

class Ivy.Entity.Element extends Ivy.Entity.Entity
{
    constructor (instance)
    {
        base.constructor(instance);

        this.RegisterEvents(
        {
            Focus        = ::Ivy.Signal(),
            Blur         = ::Ivy.Signal(),
            HoverOver    = ::Ivy.Signal(),
            HoverOut     = ::Ivy.Signal(),
            Click        = ::Ivy.Signal(),
            Release      = ::Ivy.Signal(),
            Drag         = ::Ivy.Signal()
        });
    }
}
