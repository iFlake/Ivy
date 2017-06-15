/*
    errorhandler.nut
    
    creator:     Ice Flake
    developers:  Ice Flake
    for:         Ivy
    description: Error handler
    license:     CLNS
*/

Namespace("Ivy");

class ErrorHandler
{
    Overlay    = null;

    constructor ()
    {
        this.Overlay =
        {
            //Window         = ...,
            Title          = Ivy.Entity.Label.Create(Ivy.Color(255, 255, 255)),
            Close          = Ivy.Entity.Button.Create(Ivy.Vector2(0.07, 0.04), Ivy.Color(0, 0, 0, 200), "Close"),
            Information    = Ivy.Entity.Memobox(Ivy.Vector2(0.48, 0.42), Ivy.Color(0, 0, 0, 200))
        };
    }

    function CreateOverlay()
    {

    }

    function DestroyOverlay()
    {

    }

    function Handler()
    {

    }

    function Register()
    {
        ::seterrorhandler(this.Handler);
    }
}
