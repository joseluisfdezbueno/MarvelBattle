# MarvelBattle
Marvel Battle App developed in Swift5 and RxSwift

# Architecture

The used architecture separates the view from the business logic. For this, we will find two targets; the application target (the view), and the core target (business logic).

#### App Target

Inside App Target, each screen shown to the user is encapsulated in a module: which will be made up of the view (ViewController) and its associated "presenter". The presenter will be in charge of communicating with the Core and providing to the view the data what it needs, already adapted.

#### Core Target

In the Core target, we will find the business logic of the application; as well as data management: reception through api rest, local database management, etc.

Core follows a DDD structure (Domain Drive Development), where business logic is encapsulated for each specific domain.

The entry point of a domain is a class {DomainName} Service.

# Libraries

The following external libraries have been used for this project: RxSwift, RealmSwift
