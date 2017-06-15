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
    _Position    = null;
    _Size        = null;

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

        this.RegisterSetHooks(
        {
            "Position": function (value)
            {
                this._Position            = value;
                this.Instance.Position    = value;
            },
            "Size": function (value)
            {
                this._Size            = value;
                this.Instance.Size    = value;
            }
        });

        this.RegisterGetHooks(
        {
            "Position": function ()
            {
                return this._Position;
            },
            "Size": function (value)
            {
                return this._Size;
            }
        });

        this._Position    = this.Instance.Position;
        this._Size        = this.Instance.Size;
    }
}
