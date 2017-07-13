/*
    vector.nut
    
    creator:     Ice Flake
    developers:  Ice Flake
    for:         Ivy
    description: Relatively positioned vector
    license:     Unlicense
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
        local screen = ::GUI.GetScreenSize();

        return this.Relative == true ? ::VectorScreen(this.X * screen.X, this.Y * screen.Y) : ::VectorScreen(this.X, this.Y);
    }

    function Relativate()
    {
        local screen = ::GUI.GetScreenSize();

        return this.Relative == true ? ::Ivy.Vector2(this.X, this.Y) : ::Ivy.Vector2(this.X / screen.X, this.Y / screen.Y);
    }

    function _add(with)
    {
        if (typeof with != "Ivy::Vector2") throw "Attempt to add Ivy::Vector2 with " + typeof with;

        return ::Ivy.Vector2(this.Relativate().X + with.Relativate().X, this.Relativate().Y + with.Relativate().Y);
    }

    function _sub(with)
    {
        if (typeof with != "Ivy::Vector2") throw "Attempt to subtract " + typeof with + " from Ivy::Vector2";

        return ::Ivy.Vector2(this.Relativate().X - with.Relativate().X, this.Relativate().Y - with.Relativate().Y);
    }

    function _mul(with)
    {
        if (typeof with != "Ivy::Vector2") throw "Attempt to multiply Ivy::Vector2 by " + typeof with;

        return ::Ivy.Vector2(this.Relativate().X * with.Relativate().X, this.Relativate().Y * with.Relativate().Y);
    }

    function _div(with)
    {
        if (typeof with != "Ivy::Vector2") throw "Attempt to divide Ivy::Vector2 by " + typeof with;

        return ::Ivy.Vector2(this.Relativate().X / with.Relativate().X, this.Relativate().Y / with.Relativate().Y);
    }

    function _modulo(with)
    {
        if (typeof with != "Ivy::Vector2") throw "Attempt to Ivy::Vector2 % " + typeof with;

        return ::Ivy.Vector2(this.Relativate().X % with.Relativate().X, this.Relativate().Y % with.Relativate().Y);
    }

    function _umn()
    {
        return ::Ivy.Vector2(-this.X, -this.Y, this.Relative);
    }

    function _typeof() return "Ivy::Vector2";
    
    function _tostring() return "Ivy::Vector2(" + this.X + ", " + this.Y + ", " + (this.Relative == true ? "true" : "false") + ")";
}
