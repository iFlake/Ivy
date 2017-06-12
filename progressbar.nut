/*
    editbox.nut
    
    creator:     Ice Flake
    developers:  Ice Flake
    for:         Ivy
    description: Editbox extensions
    license:     CLNS
*/

Namespace("Ivy::Entity");

class Ivy.Entity.ProgressBar extends Ivy.Entity.Element
{
    constructor (instance)
    {
        base.constructor(instance);
    }

    static function Create(position, size, color, selectedcolor, maxvalue = 100)
    {
        return ::Ivy.Entity.ProgressBar(::GUIProgressBar(position.Translate(), size.Translate(), color, selectedcolor, GUI_FLAG_NONE, maxvalue));
    }
}
