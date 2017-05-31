/*
    search.nut
    
    creator:     Ice Flake
    developers:  Ice Flake
    for:         Ivy
    description: Entity searches
    license:     CLNS
*/

Namespace("Ivy::Search");

Namespace("Ivy::Internal::Cache::Players");
Namespace("Ivy::Internal::Cache::Elements");


function Ivy::Search::FindPlayer(instance)
{
    if (::Ivy.Internal.Cache.Players.rawin(instance)) return ::Ivy.Internal.Cache.Players[instance];
    else
    {
        local cinstance = ::Ivy.Entity.Player(instance);

        ::Ivy.Internal.Cache.Players.rawset(instance.weakref(), cinstance);
        return cinstance;
    }
}

function Ivy::Search::FindElement(instance)
{
    if (::Ivy.Internal.Cache.Elements.rawin(instance)) return ::Ivy.Internal.Cache.Elements[instance];
    else
    {
        local cinstance = ::Ivy.Entity.Elements(instance);

        ::Ivy.Internal.Cache.Elements.rawset(instance.weakref(), cinstance);
        return cinstance;
    }
}
