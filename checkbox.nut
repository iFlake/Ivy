/*
    checkbox.nut
    
    creator:     Ice Flake
    developers:  Ice Flake
    for:         Ivy
    description: Checkbox extensions
    license:     CLNS
*/

Namespace("Ivy::Entity");

class Ivy.Entity.Checkbox extends Ivy.Entity.Element
{
    Checked    = null;

    constructor (instance)
    {
        base.constructor(instance);

        this.RegisterEvents(
        {
            Toggle    = ::Ivy.Signal()
        });

        this.Checked = false;

        this.On.Toggle.Connect(function (checked)
        {
            this.Checked    = checked;
        }, this);
    }

    static function Create(color)
    {
        return ::Ivy.Entity.Checkbox(::GUICheckbox(::VectorScreen(0, 0), color));
    }
}
