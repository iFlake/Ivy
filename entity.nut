/*
    entity.nut
    
    creator:     Ice Flake
    developers:  Ice Flake
    for:         Ivy
    description: Base entity
    license:     CLNS
*/

Namespace("Ivy::Entity");

class Ivy.Entity.Entity
{
    On          = null;
    Instance    = null;

    constructor (instance)
    {
        this.On          = { };
        this.Instance    = instance;
    }

    function Delete() this.Instance = null;

    function RegisterEvents(events) foreach (idx, event in events) this.On.rawset(idx, event);

    function _set(idx, value) this.Instance[idx] = value;
    function _get(idx) return this.Instance[idx];
    function _delslot(idx) return this.Instance._delslot(idx);

    function _add(with) return this.Instance + with;
    function _sub(with) return this.Instance - with;
    function _mul(with) return this.Instance * with;
    function _div(with) return this.Instance / with;
    function _unm(with) return -this.Instance;
    function _modulo(with) return this.Instance % with;

    function _cmp(with) return this.Instance == with;
    function _nexti() return this.Instance._nexti();
    function _call(...) return this.Instance._call.acall(vargv);
}
