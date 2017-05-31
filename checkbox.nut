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

    static function Create(position, color)
    {
        return ::Ivy.Entity.Checkbox(::GUICheckbox(position.Translate(), color));
    }
}
