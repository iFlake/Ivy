/*
    vector.nut
    
    creator:     Ice Flake
    developers:  Ice Flake
    for:         Ivy
    description: Relatively positioned vector
    license:     CLNS
*/

Namespace("Ivy");

class Ivy.Vector2 //todo: Make metamethods behave with relativity
{
    Relative    = null;

    X           = null;
    Y           = null;

    constructor (x, y, relative = true)
    {
        this.Relative    = relative;

        this.X           = x;
        this.Y           = y;
    }

    function Translate()
    {
        local screen == ::GUI.GetScreenSize();

        return this.Relative == true ? ::VectorScreen(this.X * screen.X, this.Y * screen.Y) : ::VectorScreen(this.X, this.Y);
    }

    function _add(with)
    {
        if (typeof with != "Ivy::Vector2") throw "Attempt to add Ivy::Vector2 with " + typeof with;

        return ::Ivy.Vector2(this.X + with.X, this.Y + with.Y);
    }

    function _sub(with)
    {
        if (typeof with != "Ivy::Vector2") throw "Attempt to subtract " + typeof with + " from Ivy::Vector2";

        return ::Ivy.Vector2(this.X - with.X, this.Y - with.Y);
    }

    function _mul(with)
    {
        if (typeof with != "Ivy::Vector2") throw "Attempt to multiply Ivy::Vector2 by " + typeof with;

        return ::Ivy.Vector2(this.X * with.X, this.Y * with.Y);
    }

    function _div(with)
    {
        if (typeof with != "Ivy::Vector2") throw "Attempt to divide Ivy::Vector2 by " + typeof with;

        return ::Ivy.Vector2(this.X / with.X, this.Y / with.Y);
    }

    function _modulo(with)
    {
        if (typeof with != "Ivy::Vector2") throw "Attempt to Ivy::Vector2 % " + typeof with;

        return ::Ivy.Vector2(this.X % with.X, this.Y % with.Y);
    }

    function _umn()
    {
        return ::Ivy.Vector2(-this.X, -this.Y);
    }

    function _typeof() return "Ivy::Vector2";
    
    function _tostring() return "Ivy::Vector2(" + this.X + ", " + this.Y + ", false)";
}
