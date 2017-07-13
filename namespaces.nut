/*
    namespaces.nut
    
    creator:     Ice Flake
    developers:  Ice Flake
    for:         Ivy
    description: Namespace-like functionality for Squirrel
    license:     Unlicense
*/

function Namespace(ns)
{
    local tables      = split(ns, "::");
    local ltable      = getroottable();

    local iterator    = 0;

    foreach (idx, table in tables)
    {
        if (table == "") continue;

        if (ltable.rawin(table) == true)
        {
            ltable = ltable[table];

            continue;
        }
        
        ltable[table] <- { };
        ltable = ltable[table];
    }
}
