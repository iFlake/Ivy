/*
    player.nut
    
    creator:     Ice Flake
    developers:  Ice Flake
    for:         Ivy
    description: Player entity
    license:     Unlicense
*/

Namespace("Ivy::Entity");

class Ivy.Entity.Player extends Ivy.Entity.Entity
{
    constructor (instance)
    {
        base.constructor(instance);

        this.On    <-
        {
            Death    = ::Ivy.Signal(),
            Shoot    = ::Ivy.Signal()
        };
    }
}
