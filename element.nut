/*
    element.nut
    
    creator:     Ice Flake
    developers:  Ice Flake
    for:         Ivy
    description: Element extensions
    license:     Unlicense
*/

Namespace("Ivy::Entity");

class Ivy.Entity.Element extends Ivy.Entity.Entity
{
    _Position          = null;
    _Size              = null;

    _EventResize       = null;

    _Parent            = null;
    
    _Relation          = null;
    _Relative          = null;
    _Offset            = null;

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
            Drag         = ::Ivy.Signal(),

            Destroy      = ::Ivy.Signal()
        });

        this.RegisterSetHooks(
        {
            "Position": function (value)
            {
                this._Position            = value;
                this.Instance.Position    = value.Translate();
            },
            "Size": function (value)
            {
                this._Size            = value;
                this.Instance.Size    = value.Translate();
            },
            "Parent": function (value)
            {
                this._Parent    = value;
                this._Parent.AddChild(this);
            }
        });

        this.RegisterGetHooks(
        {
            "Position": @() this._Position;
            "Size": @() this._Size;
            "Parent": @() this._Parent;
        });

        this._Position    = this.Instance.Position;
        this._Size        = this.Instance.Size;

        if (ICAutoAdjustDimensions == true)
        {
            this._EventResize = ::Ivy.IClientManager.On.GameResize.Connect(function ()
            {
                this.Instance.Size        = this._Size.Translate();
                this.Instance.Position    = this._Position.Translate();
            }, this);

            this.On.Destroy.Connect(function ()
            {
                ::Ivy.IClientManager.On.GameResize.Disconnect(this._EventResize);
            });
        }
    }

    function Destroy()
    {
        this.On.Destroy.Emit();

        this.Instance    = null;
    }


    function Apply(settings)
    {
        foreach (setting, value in settings) this[setting] = value;
        return this;
    }
}
