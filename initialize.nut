/*
    initialize.nut
    
    creator:     Ice Flake
    developers:  Ice Flake
    for:         Ivy
    description: Initialization file
    license:     Unlicense
*/

Namespace("Ivy");

if (ICRegisterClientManager == true)
{
    Ivy.IClientManager    <- Ivy.ClientManager();
    Ivy.IClientManager.Register();
}
