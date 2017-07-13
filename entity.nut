/*
    entity.nut
    
    creator:     Ice Flake
    developers:  Ice Flake
    for:         Ivy
    description: Base entity
    license:     Unlicense
*/

Namespace("Ivy::Entity");

class Ivy.Entity.Entity
{
    On          = null;
    Instance    = null;
    SetHooks    = null;
    GetHooks    = null;

    constructor (instance)
    {
        this.On          = { };
        this.Instance    = instance;
        this.SetHooks    = { };
        this.GetHooks    = { };
    }

    function Delete() this.Instance = null;

    function RegisterEvents(events) foreach (idx, event in events) this.On.rawset(idx, event);

    function RegisterSetHooks(hooks) foreach (idx, hook in hooks) this.SetHooks.rawset(idx, hook);
    function RegisterGetHooks(hooks) foreach (idx, hook in hooks) this.GetHooks.rawset(idx, hook);

    function _set(idx, value) return this.SetHooks.rawin(idx) == true ? this.SetHooks[idx](value) : this.Instance[idx] = value;
    function _get(idx) return this.GetHooks.rawin(idx) == true ? this.GetHooks[idx]() : this.Instance[idx];
    function _delslot(idx) return this.Instance._delslot(idx);

    function _add(with) return this.Instance + with;
    function _sub(with) return this.Instance - with;
    function _mul(with) return this.Instance * with;
    function _div(with) return this.Instance / with;
    function _unm(with) return -this.Instance;
    function _modulo(with) return this.Instance % with;

    function _cmp(with) return this.Instance <=> with;
    function _nexti() return this.Instance._nexti();
    function _call(...) return this.Instance._call.acall(vargv);
}
