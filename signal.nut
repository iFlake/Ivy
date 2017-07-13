/*
    signal.nut
    
    creator:     Ice Flake
    developers:  Ice Flake
    for:         Ivy
    description: Signal events
    license:     Unlicense
*/

Namespace("Ivy");
Namespace("Ivy::Internal::Signals");

class Ivy.Signal
{
    Connections              = null;

    constructor ()
    {
        this.Connections    = {};
    }

    function AllocateConnectionIndex()
    {
        local idx = 0;

        while (Connections.rawin(idx)) ++idx;

        return idx;
    }

    function Connect(event, env = null)
    {
        local connection = ::Ivy.Internal.Signals.Connection();

        connection.Environment    = env == null ? ::getroottable() : env;
        connection.Event          = event;

        this.Connections[this.AllocateConnectionIndex()] <- connection;

        return connection;
    }

    function ConnectDispose(event, iterations, env = null)
    {
        local connection = ::Ivy.Internal.Signals.Connection();

        connection.Environment    = env == null ? ::getroottable() : env;
        connection.Event          = event;

        connection.Dispose        = iterations;

        this.Connections[this.AllocateConnectionIndex()] <- connection;

        return connection;
    }

    function Disconnect(connection)
    {
        foreach (idx, _connection in this.Connections)
        {
            if (_connection == connection) delete this.Connections[idx];
        }
    }

    function Emit(...)
    {
        foreach (idx, connection in this.Connections)
        {
            if (connection.Dispose != null)
            {
                --connection.Dispose;

                if (connection.Dispose < 0)
                {
                    delete this.Connections[idx];
                    continue;
                }
            }

            local parameters = clone vargv;
            parameters.insert(0, connection.Environment);

            connection.Event.acall(parameters);
        }
    }
}

class Ivy.Internal.Signals.Connection
{
    Environment    = null;
    Event          = null;

    Dispose        = null;
}
