/*
    autoload.nut
    
    creator:     Ice Flake
    developers:  Ice Flake
    for:         Ivy
    description: Configuration file
    license:     CLNS
*/

Namespace("Ivy");

if (ICRegisterClientManager == true)
{
    Ivy.IClientManager    <- Ivy.ClientManager();
    Ivy.IClientManager.Register();
}

if (ICRegisterErrorHandler == true)
{
    Ivy.IErrorHandler    <- Ivy.ErrorHandler();
    Ivy.IErrorHandler.Register();
}