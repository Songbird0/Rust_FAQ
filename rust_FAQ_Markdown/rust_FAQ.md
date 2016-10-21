# Synopsis

Cette FAQ est très certainement destinée à être modifée. Si vous parvenez à débusquer une erreur dans les Q/R proposées, reportez-la au responsable de la rubrique ou à un mainteneur de la FAQ, s'il vous plaît.

**Note **: Il se pourrait qu'il y ait quelques confusions dans les Q/R - un deuxième passage sera fait quand une grande majorité des Q/R auront été écrites.

# Introduction

## Informations générales

### Stade de rédaction

WIP (il n'existe aucune publication "propre" de cette FAQ pour le moment)

### Présentation

Cette FAQ a été conçue pour répondre, certes, aux questions les plus courantes, mais également pour paraphraser certaines explications fournies par la documentation officielle qui auraient pu être mal comprises.

Elle n'a en revanche pas pour but de traduire, mais bien de réexpliquer les passages qui pourraient s'avérer compliqués à comprendre de prime abord. Vous pourrez donc y trouver des explications complètes, mais aussi des liens vers la documentation officielle si, à l'inverse, vous venez de découvrir Rust et ne vous êtes pas encore rendu(e) vers cette dernière.

### Affiliation

Les ressources proposées par ce dépôt ne sont pas officielles ou affiliées à l'équipe en charge du projet Rust et/ou la fondation Mozilla. Ce document peut toujours contenir des erreurs et/ou confusions pouvant être invalidés; Bien que cette FAQ soit rédigée avec le plus grand soin, référez-vous toujours à la documentation officielle si vous avez un doute quant à la véracité des propos entretenus par cette ressource.

### Contribution

Vous souhaiteriez contribuer ? Super, nous vous remercions pour votre intérêt à l'égard de cette ressource. :)

Il existe actuellement plusieurs moyens de contribuer à la maintenance (ou à l'enrichissement) de ce repo:


* La façon la plus simple et directe de contribuer est la relecture orthographique du document. Pour ceci, récupérez le [fichier xml](https://github.com/Songbird0/Rust_FAQ/blob/master/rust_FAQ.xml) et ne vous préoccupez que des paragraphres. (les méta-données ne sont pas importantes pour cette tâche.)
*  Il est également possible pour vous de corriger le document xml en utilisant les outils proposés par [developpez.com](https://github.com/Songbird0/Rust_FAQ/blob/master/developpez.com), vous évitant ainsi de modifier directement le document si sa lecture vous incommode; Si cette méthode vous intéresse, n'hésitez pas à me contacter [ici](https://twitter.com/_Spyglass_) ou [ici](http://www.developpez.net/forums/u897329/songbird_/).

  
  * Aucun de ces liens ne vous convient pour me contacter ? Envoyez moi un mail à cet adresse: chaacygg[at]gmail[dot]com.
*  Enfin, il vous est possible d'enrichir ce document en proposant de nouvelles Questions/Réponses ou tout simplement en créant de nouvelles sections accueillant d'autres types de ressources. Contrairement à la relecture et l'édition mineure, il serait plus sage d'opter pour utiliser le kit d'exportation que propose [developpez.com](https://github.com/Songbird0/Rust_FAQ/blob/master/developpez.com) pour vous évitez des tâches d'éditions fastidieuses.

  
  * Cette solution ne vous convient pas ? Aucun problème, une version markdown de la FAQ va bientôt être publiée !

### Licence et condition d'utilisation

Des questions concernant l'utilisation de cette ressource ? Je vous invite à consulter le fichier LICENCE.md pour plus d'informations.

Les informations contenues dans le fichier ne vous suffisent pas ? Contactez-moi:


*  [Twitter](https://twitter.com/_Spyglass_) 
*  [Profil developpez](http://www.developpez.net/forums/u897329/songbird_/) 

# Langage

## Questions générales

### Comment déclarer une variable ?

La déclaration d'une variable en Rust se fait par le biais du mot-clé *let*, permettant ainsi de différencier une assignation d'une expression.

Vous pouvez bien entendu déclarer et initialiser plusieurs variables en même temps de cette manière :



```rust
fn main() 
{
    let (foo, bar, baz) = (117, 42, "Hello world!");
}
```

Ou effectuer une déclaration multiligne :



```rust
fn main()
{
    let foo = 117;
    let bar = 42;
    let baz = "Hello world!";
}
```

Voir aussi : [Rust possède-t-il un typage dynamique ?](#LII-A-3 "Rust possède-t-il un typage dynamique ?")

### Comment assigner un objet par référence ?

Il existe deux façons de faire :


1. Préciser par le biais du caractère &. (C-style)
2. En utilisant le mot-clé ref comme ceci :



```rust
fn main() 
{
    let foo = 117i32;
    let ref bar = foo;
    let baz = &foo; //idem
}
```

### Rust possède-t-il un typage dynamique ?

Non.

Bien qu'il en donne l'air grâce à une syntaxe très aérée, Rust dispose d'un typage statique mais « optionnel » pour le développeur si il désire faire abstraction des types, mais il perdra, en toute logique, l'avantage de choisir la quantité de mémoire que sa ressource consommera.

Vous ne pouvez, par exemple, pas faire ceci :



```rust
fn main() 
{
    let mut foo = 1;
    foo = " Hello world !";
}
```

Le type ayant été fixé par la première donnée, il n'est plus possible de changer en cours de route.

Voir aussi : [Comment typer ses données/variables](#LII-A-4 "Comment typer ses données/variables ?") ?

### Comment typer ses données/variables ?

Pour les types primitifs, il existe deux manières de typer une variable :



```rust
fn main() 
{
    let foo : i32 = 117;
}
```

Ou :



```rust
fn main() 
{
    let bar = 117i32;
}
```

### Quelle est la différence entre &str et String ?

Du point de vue des packages, *String* se trouve dans le package *std::string* et *&str* dans le package std.

Du point de vue des types, *String* est un wrapper de *&str* et ce dernier est tout simplement l'alias représentant le type primitif des chaînes de caractères.



```rust
fn main() 
{
    let foo : &str = "Hello world!"; //ça fonctionne
    let bar : String = foo; //erreur
    let baz : String = String::from(foo); //Ok !
}
```

### Comment créer une chaîne de caractères ?

La question pourrait paraître évidente dans d'autres langages, toutefois, après avoir écrit quelque chose de ce style :



```rust
fn main() 
{
    let foo : String = "Hello world!";
}
```

Le compilateur vous a renvoyé cette erreur :



```texinfo
  |>
4 |>    let foo : String = "Hello world!";
  |>                       ^^^^^^^^^^^^^^ expected struct `std::string::String`, found &-ptr
```

Il se trouve que la structure *String* est un wrapper.

Vous vous retrouvez donc à typer votre variable pour accueillir une instance de la structure *String* alors que vous créez une chaîne de caractères primitive.

Pour remédier au problème (si vous souhaitez malgré tout utiliser le wrapper), vous pouvez convertir une chaîne de caractères de type ***&str*** grâce à la fonction ***String::from()*** :



```rust
fn main()
{
    let foo : String = String::from("Hello world!");
    //ou
    let foo : &str = "Hello world!";
}
```

### Quelle version de Rust est recommandée ?

Actuellement***25 septembre 2016***, la version stable la plus récente est la **1.11.0**.

Mais vous pouvez toutefois utiliser une version un peu plus vieille.

Pour cette Q/R, la version de Rust sur mon poste était la **1.9.0**.

Voir aussi : [Page officielle du langage Rust](https://www.rust-lang.org/en-US/ "Ouvrir un nouvel onglet")

### Rust est-il orienté objet ?

Rust hérite des structures du *C*, elles n'incluent donc pas l'encapsulation des données comme nous pourrions l'imaginer avec une classe.

Il dispose d'un aspect de la POO, de prime abord, assez primitif ; Rust permet toutefois de bénéficier du polymorphisme grâce aux « traits » qui pourraient être comparées aux interfaces Java/C#.

Cependant, le langage ne supporte pas l'héritage multiple (ni l'héritage simple) entre les structures : comme il serait possible de le faire avec des classes.

Voir aussi : [Qu'est-ce qu'un « trait » ?](#LII-A-9 "Qu'est-ce qu'un « trait » ?")

### Qu'est-ce qu'un « trait » ?

Un trait pourrait être comparé aux interfaces que l'on peut retrouver dans la plupart des langages orientés objet. (Java, C#…)

Les traits vous permettent de déclarer des fonctions abstraites/virtuelles pour ensuite les implémenter au sein d'une structure grâce au mot-clé *impl* comme ceci :



```rust
trait Greeter
{
    fn greetings(&self);
}

struct Person;

impl Greeter for Person
{
    fn greetings(&self)
    {
        println!("Hello, my friends!");
    }
}

fn main()
{
    let person = Person;
    person.greetings();
}
```

### Rust supporte-t-il la surchage des fonctions ?

Rust ne supporte pas la surcharge des fonctions.

Le langage repose sur le « Builder Pattern » qui consiste à concevoir des « fabriques/factories » chargées de générer l'objet désiré.

Vous pouvez retrouver quelques explications à propos de ce design pattern [ici](https://doc.rust-lang.org/book/method-syntax.html#builder-pattern) ou encore [ici](https://fr.wikipedia.org/wiki/Monteur_(patron_de_conception)#Exemple "Ouvrir un nouvel onglet").

Voir aussi : [Comment déclarer des paramètres optionnels](#LII-A-11 "Comment déclarer des paramètres optionnels ?") ?

### Comment déclarer des paramètres optionnels ?

Il n'est pas possible de déclarer des paramètres optionnels avec Rust dans sa version actuelle.

Toutefois, il est toujours possible d'user de macros pour capturer différentes expressions et ainsi adapter votre code en fonction de la situation.

Le langage repose sur le « Builder Pattern » qui consiste à concevoir des « fabriques/factories » chargées de générer l'objet désiré.

Vous pouvez retrouver quelques explications à propos de ce design pattern [ici](https://doc.rust-lang.org/book/method-syntax.html#builder-pattern) ou encore [ici](https://fr.wikipedia.org/wiki/Monteur_(patron_de_conception) "Ouvrir un nouvel onglet").

Voir aussi : [Comment utiliser une macro ?](#LII-A-33 "Comment utiliser une macro ?")

### Comment créer un tableau ?

Un tableau dans sa forme la plus primitive se déclare comme ceci :



```rust
let foo : [i32; 10] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
```

**Note **: la taille du tableau doit être explicite, sous peine de recevoir une erreur de la part du compilateur.

### A quoi sert le mot-clé super ?

Contrairement à ce que l'on pourrait croire, le mot-clé super ne représente pas une référence vers l'instance courante d'une classe mère, mais représente seulement le « scope » supérieur. (dans un module)

Exemple :



```rust
mod mon_module
{
    pub fn ma_fonction()
    {
        println!("Scope supérieur");
    }
    pub mod fils
    {
        pub fn fonction_enfant()
        {
            super::ma_fonction();
        }
    }
    pub mod fille
    {
        pub fn fonction_enfant()
        {
            super::ma_fonction();
        }
    }
}

fn main()
{
    mon_module::fils::fonction_enfant();
    mon_module::fille::fonction_enfant();
}
```

### A quoi sert le mot-clé self ?

Le mot-clé self renvoie à une copie (ou la référence(&self)) de l'instance courante.

Il est souvent rencontré :


* lorsqu'une fonction virtuelle/abstraite est implémentée au sein d'une structure,
* lorsque le développeur doit utiliser une fonction dans le module courant, 
* …

Exemple :



```rust
trait My_Trait
{
    fn my_func(&self);
}

mod My_Mod
{
    fn foo()
    {
        self::bar();
    }
    
    fn bar()
    {
    
    }
}
```

### A quoi sert le mot-clé use ?

Le mot-clé use permet de raccourcir le « chemin » des dépendences du programme, vous évitant ainsi d'expliciter les dépendences de chacune de vos ressources.

Exemple :



```rust
extern crate mon_package ;

use mon_package::mon_module::ma_fonction ;

fn main()
{
    ma_fonction() ;
}
```

Autrement dit, toute structure composée de différentes ressources peut être exploitée par le mot-clé use.

Exemple :



```rust
enum MonEnum
{
    Arg1,
    Arg2,
}

fn main()
{
    use MonEnum::{Arg1};
    let instance = Arg1; //plus la peine d'expliciter d'où provient l'instance Arg1 comme ceci:
    // let instance = MonEnum::Arg1;
}
```

### A quoi sert le mot-clé pub ?

Le mot-clé pub peut être utilisé dans *trois* contextes différents :


1. Au sein [et sur] des modules ;
2. Au sein [et sur] des traits ;
3. Au sein [et sur] des structures.

Dans un premier temps, qu'il soit utilisé sur des modules, traits, ou structures, il aura toujours la même fonction : rendre publique l'objet concerné.

Exemple :



```text
├── Cargo.lock
├── Cargo.toml
├── src
│   ├── lib.rs
│   └── main.rs
└── target
    └── debug
        ├── build
        ├── deps
        ├── examples
        ├── libmon_projet.rlib
        ├── mon_projet
        └── native
```



```rust
pub mod ma_lib //la module représentant ma bibliothèque
{
    pub mod mon_module //un module lambda
    {
        pub fn ma_fonction() //ma fonction
        {
            println!("Hi there !");
        }
    }
}
```



```rust
extern crate mon_projet;
use mon_projet::ma_lib::mon_module::ma_fonction;
fn main() 
{
    ma_fonction();
}
```

Renvoie :



```text
Hi there !
```

« mon_projet » est le nom porté par votre projet dans le manifest Cargo.toml.

Pour cet exemple, voici le manifest rédigé :



```toml
[package]
name = "mon_projet"
version = "0.1.0"
authors = ["Songbird0 <chaacygg@gmail.com>"]

[dependencies]
```

**Quid lorsque pub est utilisé au sein de ces structures ?**

Lorsque le mot-clé pub est utilisé au sein d'un trait ou d'une structure sur une fonction, cela rend cette dernière indépendante de l'instance d'un objet. (mais peut toujours être appelée par l'une d'elles)

Autrement dit, la fonction est statique.



```rust
struct A;

impl A
{
    pub fn foo()
    {
        println!("Je suis statique !");
    }
    
    pub fn new() -> A
    {
        return A;
    }
    
    fn bar(&self)
    {
        println!("Fonction non-statique");
    }
}

fn main()
{
    let instance : A = A::new();
    A::foo();
    instance.bar();
    //instance::bar() -> erreur
}
```

### A quoi servent les mot-clés extern crate ?

Les mot-clés *extern crate* permettent d'importer un paquet entier de modules dans le fichier courant.

Le principe est simple, il vous suffit seulement de créer en premier lieu un projet en mode « bibliothèque » pour réunir tous les modules que vous créerez, de créer un fichier qui accueillera le point d'entrée de votre programme, puis d'importer votre paquet.

Bien entendu, si vous souhaitez importer un paquet qui n'est pas de vous, il vous faudra l'inscrire dans votre manifest.

Voir aussi :

Pour voir un exemple de création de paquet, vous pouvez vous rendre à la Q/R : « [A quoi sert le mot-clé pub ?](#LII-A-16 "A quoi sert le mot-clé pub ?") »

[Comment installer de nouvelles bibliothèques ?](#LII-C-6 "Comment installer de nouvelles bibliothèques ?")

### A quoi sert le mot-clé mod ?

Le mot-clé `mod` vous permet de créer un module.

Voir aussi :

[A quoi sert un module ?](#LII-A-19 "A quoi sert un module ?")

### A quoi sert un module ?

Il vous permet de réunir plusieurs objets (structures, traits, fonctions, d'autres modules…) dans un même fichier puis de les réutiliser à plusieurs endroits dans votre programme.

Voir aussi :


*  [A quoi sert le mot-clé pub ?](#LII-A-16 "A quoi sert le mot-clé pub ?") 
*  [A quoi servent les mot-clés extern crate ?](#LII-A-17 "A quoi servent les mot-clés extern crate ?") 

### Comment créer un module ?

Voici comment créer un module :



```rust
mod A
{
    fn votre_fonction(){}
    fn une_autre_fonction(){}
    mod B
    {
        struct C{}
        trait D{}
    }
}
```

### A quoi sert le mot-clé type ?

Le mot-clé type permet de créer des alias et ainsi réduire la taille des types personnalisés (ou primitifs).

Voici un exemple :



```rust
struct VeryLongTypeName;

impl VeryLongTypeName
{
    pub fn new() -> VeryLongTypeName
    {
        println!("In new function");
        return VeryLongTypeName;
    }
}

type ShortName = VeryLongTypeName;

fn main()
{
    let foo = ShortName::new();
}
```

Liens :

Pour exécuter l'exemple de la Q/R, vous pouvez vous rendre [ici](https://is.gd/hPONv0 "Rust Playground").

Retrouvez des explications [ici](http://stackoverflow.com/questions/29447920/what-is-the-rust-type-keyword "Post StackOverflow").

[Explications de la documentation officielle](http://rustbyexample.com/cast/alias.html "Rust by Example").

### A quoi sert le mot-clé loop ?

Le mot-clé loop est un sucre syntaxique qui permet de remplacer le fameux :



```rust
while(true)
{

}
```

Préférez donc cette syntaxe :



```rust
loop
{

}
```

Liens :

[Documentation officielle](https://doc.rust-lang.org/book/loops.html#loop "Ancre vers le mot-clé loop").

### A quoi sert le mot-clé where ?

Le mot-clé where permet de filtrer les objets passés en paramètres dans une fonction génériques, par exemple :



```rust
trait Soldier{}
trait Citizen{}
struct A;
struct B;
impl Soldier for A{}
fn foo<T>(test: T) -> T where T: Soldier
{
    return test;
}
fn main()
{
    let soldier : A = A;
    let citizen : B = B;
    foo(soldier);
    foo(citizen); //error: the trait bound `B: Soldier` is not satisfied
}
```

### A quoi sert le mot-clé unsafe ?

Le mot-clé `unsafe` permet, comme son nom l'indique, de casser certaines règles natives de Rust pour effectuer des opérations « à risque ».

`unsafe` peut être utilisé dans quatre contextes différents :

La déclaration d'une fonction :



```rust
unsafe fn dangerous_function() {}
```

La création d'un nouveau scope :



```rust
fn main() → ()
{
    unsafe {/*dangerous scope*/}
}
```

La déclaration d'un trait :



```rust
unsafe trait Dangerous_trait{}
```

L'implémentation d'un trait :



```rust
unsafe impl A for B {}
```

En pratique, le mot-clé `unsafe` permet une manipulation de la mémoire plus approfondie, plus directe, mais aussi plus compliquée, puisque le langage n'applique pas certaines règes.

Voir aussi :

[Quelles sont les règles non-appliquées dans ces contextes ?](#LII-A-25 "Quelles sont les règles non-appliquées dans ces contextes ?")

[Quels comportements sont considérés « non-sûrs » par Rust ?](#LII-A-26 "Quels comportements sont considérés « non-sûrs » par Rust ?")

### Quelles sont les règles non-appliquées dans ces contextes ?

Trois règles, et seulement trois, sont brisées dans les blocs (et fonctions) unsafe :

L'accès et la modification d'une variable globale (statique) muable sont autorisés ;

Il est possible de déréférencer un pointeur (non-nul, donc) ;

Il est possible de faire à une fonction non-sûre.

### Quels comportements sont considérés « non-sûrs » par Rust ?

Pour en retrouver une liste exhaustive, rendez-vous à la [section dédiée](https://doc.rust-lang.org/book/unsafe.html#what-does-safe-mean "Ouvrir un nouvel onglet").

### A quoi sert le mot-clé fn ?

En rust, pour déclarer une fonction, il faut utiliser le mot-clé fn :



```rust
fn ma_fonction()
{

}
```

### A quoi sert le mot-clé match ?

Le mot-clé **match** nous permet d'implémenter le *pattern* *matching*.

Ainsi, il est possible de comparer une entrée à plusieurs tokens constants et agir en conséquence. Le pattern matching est considéré comme un test *exhaustif*, car, quoi qu'il arrive, il fera en sorte de couvrir tous les cas de figure qu'on lui propose.

Exemple :



```rust
    let foo : i32 = 117;
    match foo
    {
        117 => println!("foo's value equals 117 !"),
        _ => println!("You know nothing, John."), //s'éfforcera de trouver une réponse
    }
```

Jusqu'ici, il semblerait que le mot-clé match ne soit pas capable de faire preuve de plus de souplesse qu'un switch, ce qui est bien entendu le contraire !

Vous pouvez assigner le résultat de vos tests directement dans une variable sans avoir à l'écrire dans votre switch/match.

Exemple :



```rust
fn main()
{
    let foo : i32 = 117;
    let mut bar : String;
    match foo
    {
        117 => println!("foo's value equals 117 !"),
        _ => println!("You know nothing, John."),
    }
    
    bar = match foo
    {
        117 => "It's ok !".to_string(),
        _ => "foo isn't equals to 117".to_string(),
    };
    
    println!("{}", &bar);
}
```

Voir aussi :

Vous pouvez exécuter l'exemple [ici](https://is.gd/otk1eC).

Vous pouvez retrouver [une source](https://en.wikipedia.org/wiki/Pattern_matching) abordant le pattern matching. (avec plusieurs exemples)

[Partie de la documentation officielle abordant l'implémentation du pattern matching](https://doc.rust-lang.org/book/match.html).

### A quoi sert le mot-clé ref ?

Le mot-clé ref est une alternative au caractère spécial '&' pour expliciter le renvoie d'une référence d'un objet :



```rust
struct A ;
fn main()
{
    let foo : A = A ;
    let bar : &A = &foo ; // ou let ref bar = foo ;
}
```

### A quoi sert le mot-clé mut ?

Le mot-clé `mut` permet de rendre l'une de vos variable muables lors de sa déclaration.



```rust
let mut foo : i32 = 0 ;
let bar : i32 = 1 ;
foo = 1 ;
bar = 2 ; //erreur
```

### Une erreur survient lorsque que je modifie le contenu de ma variable ! Que faire ?

Il se peut que vous ayez omis la particularité de Rust : tout est immuable par défaut.

Pour permettre à une variable de modifier son contenu, il vous faudra utiliser le mot-clé `mut`.

Voir aussi : [A quoi sert le mot-clé mut ?](#LII-A-30 "A quoi sert le mot-clé mut ?")

### Qu'est-ce qu'une macro ?

Une macro est ce que l'on peut appeler vulgairement : une fonction très puissante.

Grâce aux macros, nous pouvons capturer *plusieurs* groupes *d'expressions* et ainsi écrire les instructions désirées selon *chaque* cas.

En Rust, c'est ce qui se rapproche le plus de la *surcharge de méthodes* en Java.

Voir aussi : [Comment utiliser une macro ?](#LII-A-33 "Comment utiliser une macro ?")

### Comment utiliser une macro ?

Pour utiliser une macro, il faut d'abord la déclarer en utilisant le mot-clé `macro_rules!`.



```rust
macro_rules! foo
{
    () => ();
}
```

Toutes les macros (y compris celle présentée ici) respestent une règle très importante : elles doivent toutes capturer au moins une expression pour être valide et compilées. (en l'occurrence, la regex `() => () ;`)

C'est donc cela, l'une des différences majeures entre une fonction/procédure et une macro : cette dernière est capable de capturer des expressions rationnelles, conserver en mémoire ce que désire le développeur, puis de les ré-utiliser dans le corps de l'une d'entre-elles.

Ces « super » fonctions demandent donc quelques notions liées aux expressions rationnelles pour vous permettre d'apprécier pleinement ce puissant mécanisme.

Voici un exemple très basique de macro :



```rust
/// **Attention**:
/// 
///Cette macro n'utilise qu'un seul type de spécificateur, mais il en existe beaucoup d'autres.
macro_rules! foo
{
    ($your_name:expr, $your_last_name:expr, $carriage_return: expr) =>
    {
        if $carriage_return == true
        {
            println!("My name's {} {}.", $your_name, $your_last_name); 
        }
        else { print!("My name's {} {}.", $your_name, $your_last_name); }
    };
    
    ($your_name:expr, $your_last_name:expr) =>
    {
        foo!($your_name, $your_last_name, false);
    };
    
    ($your_name:expr) =>
    {
        foo!($your_name, "", false);
    };
}

fn main() -> ()
{
    foo!("Song", "Bird", true);
    foo!("Song", "Bird"); //pas de retour à la ligne
    foo!("Song"); //là non plus
}
```

Vous aurez certainement remarqué que les paramètres passés sont assez spéciaux ; Au lieu d'avoir le nom de leur type après les deux points (« : »), il est écrit `expr`.

C'est ce que l'on appelle un « spécificateur » .

Liens :

[Visionner le résultat de cet exemple.](https://is.gd/nHfcEQ "Exemple d'utilisation d'une macro")

[Que sont les spécificateurs ?](#LII-A-34 "Que sont les spécificateurs ?")

### Que sont les spécificateurs ?

### A quoi sert le mot-clé  usize ?

Le mot-clé **usize** permet de laisser le compilateur choisir la taille en mémoire d'un entier *non-signé*. (selon l'architecture de la machine sur laquelle le programme sera exécuté)

Voir aussi : [A quoi sert le mot-clé isize ?](#LII-A-36 "A quoi sert le mot-clé isize ? ")

### A quoi sert le mot-clé isize ? 

Le mot-clé **isize** permet de laisser le compilateur choisir la taille en mémoire d'un entier *signé*. (selon l'architecture de la machine sur laquelle le programme sera exécuté)

Voir aussi : [A quoi sert le mot-clé usize ?](#LII-A-35 "A quoi sert le mot-clé usize ?")

### Existe-t-il des outils de build pour le langage Rust ?

Rust dispose d'un outil de développement multifonction nommé Cargo.

Cargo est en premier lieu un gestionnaire de paquets (qui vous permet donc de télécharger des modules Rust développés par d'autres programmeurs) mais vous épaule également dans la gestion, la construction de vos projets, la création de vos manifest, etc.

Un groupe de Q/R a été créé sur cette FAQ présentant une liste non-exhaustive de commandes supportées par Cargo suivie d'un exemple d'utilisation (vous pourrez également retrouver des exemples dans le manuel officiel de l'outil(`$ man cargo`)) :


*  [Comment créer un projet avec Cargo ?](#LII-C-1 "Comment créer un projet avec Cargo ?") 
*  [Quel type de projet puis-je créer avec Cargo ?](#LII-C-2 "Quel type de projet puis-je créer avec Cargo ?") 
*  [Comment compiler son projet ?](#LII-C-3 "Comment compiler son projet ?") 
*  [Peut-on générer de la documentation avec Cargo ?](#LII-C-4 "Peut-on générer de la documentation avec Cargo ?") 
*  [Où trouver de nouvelles bibliothèques ?](#LII-C-5 "Où trouver de nouvelles bibliothèques ?") 
*  [Comment installer de nouvelles bibliothèques ?](#LII-C-6 "Comment installer de nouvelles bibliothèques ?") 
*  [Comment publier sa bibliothèque faite-maison ?](#LII-C-7 "Comment publier sa bibliothèque faite-maison ?") 
*  [Comment lancer des tests avec Cargo ?](#LII-C-8 "Comment lancer des tests avec Cargo ?") 
*  [Comment créer ses benchmarks avec Cargo ?](#LII-C-10 "Comment créer ses benchmarks avec Cargo ?") 
*  [Comment mettre à jour mes bibliothèques ?](#LII-C-9 "Comment mettre à jour mes bibliothèques ?") 

### Comment utiliser mes fonctions en dehors de mon module ?

Pour utiliser vos fonctions en dehors de votre module, il vous faudra utiliser le mot-clé pub.

Voir aussi :

[A quoi sert le mot-clé pub ?](#LII-A-16 "A quoi sert le mot-clé pub ?")

[A quoi servent les mot-clés extern crate ?](#LII-A-17 "A quoi servent les mot-clés extern crate ?")

### Comment comparer deux objets avec Rust ?

Pour comparer deux objets avec Rust, vous pouvez utiliser la fonction eq()  implémentée grâce au trait *PartialEq*.

Exemple :



```rust
fn main()
{
    let foo = 0;
    let bar = 0;
    let baz = foo.eq(&bar); //true
    let bazz = 'Hello world !';
    let bazzz = 'Hello world !'.to_string();
    let bazzzz = bazz.eq(&bazzz); //true
}
```

Voir aussi : [Comment comparer deux objets d'une structure personnalisée avec Rust ?](#LII-A-45 "Comment comparer deux objets d'une structure personnalisée avec Rust ?")

### Qu'est-ce que le shadowing ?

Le shadowing consiste à faire abstraction des identificateurs qui pourraient être identiques à ceux se trouvant dans un scope (« champ ») plus petit, ou étranger à celui des autres identificateurs dans l'absolu.

Exemple :



```rust
fn main() -> ()
{
    let foo : &str = "Hello";
    {
        let foo : &str = "world!";
        println!("{}", &foo);
    }
    println!("{}", &foo);
}
```

La première déclaration de foo a été « éclipsée » par celle se trouvant dans le deuxième scope. Lorsque cette dernière a été détruite (ou simplement mise hors d'accès, dans ce cas), la première déclaration de foo a été de nouveau opérationnelle.

Résultat :



```rust
world!
Hello
```

### Qu'est-ce que la destructuration ?

Avec Rust, il est possible d'effectuer une « destructuration » sur certains types de données, mais qu'est-ce que cela signifie exactement ?

Grâce au pattern matching, il est possible de créer, donc, des « modèles » pour isoler une partie de la structure et ainsi vérifier si notre entrée correspond à nos attentes.

Une destrucuration peut se faire sur :

Les listes, les tuples ;

Les énumérations ;

Les structures.

Voir aussi :


*  [Comment effectuer une destructuration sur une liste ?](#LII-A-42 "Comment effectuer une destructuration sur une liste ?") 
*  [Comment effectuer une destructuration sur une énumération ?](#LII-A-43 "Comment effectuer une destructuration sur une énumération ?") 
*  [Comment effectuer une destructuration sur une structure ?](#LII-A-44 "Comment effectuer une destructuration sur une structure ?") 

### Comment effectuer une destructuration sur une liste ?

Pour isoler une valeur contenu dans un tuple, il faut d'abord écrire son modèle pour savoir où le chercher.

Par exemple, en assumant que nous cherchons une suite de chiffres dans un ordre croissant, il est simple de déterminer si cette suite est dans le bon ordre ou non.



```rust
    let foo = ("one", "two", "three");
    let bar = ("two", "one", "three"); 
    
    match bar
    {
        ("one", x, "three") =>
        {
            if x == "two"
            {
                println!("tout est en ordre !");
            }
        },
        _ => println!("on dirait qu'il y a un problème dans votre tuple..."),
    }
```

Lorsque vous construisez un modèle de ce type, gardez bien en tête que la valeur la plus à gauche représentera toujours la première valeur du tuple, et celle plus à droite représentera toujours la dernière valeur du tuple.

Rien ne vous empêche donc de faire ceci :



```rust
    let foo = ("one", "two", "three");
    let bar = ("two", "one", "three"); 
    
    match foo
    {
        ("one", x, y) =>
        {
            if (x, y) == ("two", "three") //on surveille plusieurs valeurs
            {
                println!("tout est en ordre !");
            }
        },
        _ => println!("on dirait qu'il y a un problème dans votre tuple..."),
    }
```

### Comment effectuer une destructuration sur une énumération ?

Le pattern matching vous donne la possibilité de « décortiquer » une énumération, vous permettant ainsi d'effectuer des tests complets.

Voici un exemple :



```rust
pub enum Enum
{
    One,
    Two,
    Three,
    Four,
}

fn foo(arg: Enum) -> ()
{
    match arg
    {
        Enum::One => 
        {
            println!("One");
        },
        Enum::Two =>
        {
            println!("Two");
        },
        Enum::Three =>
        {
            println!("Three");
        },
        Enum::Four =>
        {
            println!("Four");
        },
    }
}

fn main()
{
    let (bar, baz, bazz, bazzz) = (Enum::One, Enum::Two, Enum::Three, Enum::Four);
    
    foo(bar);
    foo(baz);
    foo(bazz);
    foo(bazzz);
}
```

### Comment effectuer une destructuration sur une structure ?

Tout d'abord, la question que nous pourrions nous poser est : en quoi consiste la destructuration sur une structure ?

L'idée est d'isoler, encore une fois, les propriétés qui nous intéressent.



```rust
struct A
{
    x: String,
    y: String,
    z: String,
}

fn main() -> ()
{
    let foo = A {
                    x: "Hello".to_string(),
                    y: " ".to_string(),
                    z: "world!".to_string(),
                };
    let A {x: a, y: b, z: c} = foo; //on décortique les attributs de notre structure
    println!("{}{}{}", a, b, c); //puis on les utilise dans de nouvelles variables
}
```

Vous souhaiteriez omettre un attribut ? Pas de problèmes !



```rust
    let foo = A {
                    x: "Hello".to_string(),
                    y: " ".to_string(),
                    z: "world!".to_string(),
                };
    let A {x: a, y: b, ..} = foo; //on décortique les attributs de notre structure
    println!("{}{}", a, b); //puis on les utilise dans de nouvelles variables
```

Vous pouvez également isoler ce style d'opération dans un scope plus petit (empêchant l'utilisation des variables temporaires en dehors de ce dernier) comme ceci :



```rust
    let foo = A {
                    x: "Hello".to_string(),
                    y: " ".to_string(),
                    z: "world!".to_string(),
                };
    {
        let A {x: a, y: b, z: c} = foo; //on décortique les attributs de notre structure
        println!("{}{}{}", a, b, c); //puis on les utilise dans de nouvelles variables
    }
    
    //a,b et c ne pourront plus être utilisés à partir d'ici
```

### Comment comparer deux objets d'une structure personnalisée avec Rust ?

La bibliothèque standard de Rust propose un(e) trait/ interface nommé(e) *PartialEq* composée de deux fonctions :


1.  *fn eq(&**self**, other : &instance_de_la_meme_structure) ;* 
2.  *fn ne(&**self**, other : &instance_de_la_meme_structure) ;* 

Ci-dessous figure un exemple complet d'implémentation :



```rust
struct Spartan<'a>
{

    sid: i32, 
    name: &'a str

}

impl<'a> PartialEq for Spartan<'a>
{
    fn eq(&self, other: &Spartan) -> bool
    {
        self.sid == other.sid
    }
}

impl<'a> Spartan<'a>
{
    
    pub fn new(sid: i32, name: &str) -> Spartan
    {
        Spartan
        {
            sid: sid,
            name: name,
        }
    }
}
fn main()
{
    let (foo , bar) = (Spartan::new(117, "John"), Spartan::new(062, "Jorge"));
    
    if foo == bar 
    { 
        println!("foo equals bar"); 
    } 
    else 
    { 
        println!("foo not equals bar"); 
    }
}
```

### Je n'arrive pas à utiliser les macros importées par ma bibliothèque ! Pourquoi ?

Il se pourrait que vous ayez omis d'utiliser une annotation : `#[macro_use]`

Cette dernière permet d'exporter toutes les macros qui doivent être publiques pour être utilisées à l'exterieur de la bibliothèque.



```rust
#[macro_use]
extern crate votre_lib;

fn main() -> ()
{
 votre_macro!();
}
```

Si vous ne parvenez toujours pas à les utiliser, il est possible que vous ayez omis l'annotation `#[macro_export]` dans les modules comportant vos macros.



```rust
// dans le fichier lib.rs
#[macro_use]//bien préciser que ce module utilise des macros
pub mod votre_conteneur
{
    #[macro_export]
    macro_rules! foo
    {
        () => ();
    }
    #[macro_export]
    macro_rules! bar
    {
        () => ();
    }
    #[macro_export]
    macro_rules! baz
    {
        () => ();
    }
}
```

Si votre problème persiste, je vous invite à vous rendre sur les forums figurant dans la rubrique programmation pour obtenir de l'aide. Présentez clairement l'erreur que le compilateur vous renvoi dans votre post.

### A quoi servent les mot-clés if let ?

La combinaison des deux mot-clés permet d'assigner, de manière concise, du contenu à une variable.



```rust
fn main() -> ()
{
    let foo : Option<String> = Some("Hello world!".to_string());
    let mut bar : bool = false;
    
    if let Some(content) = foo // si la variable foo contient quelque chose...
    {
        bar = true;
    }
    else
    {
        println!("foo's content is None");
    }
}
```

C'est un moyen simple et efficace d'assigner du contenu sans passer par le pattern matching.

### A quoi servent les mot-clés while let ?

La combinaison des deux mot-clés permet d'effectuer des tests de manière concise et ainsi nous éviter de passer par le pattern matching lorsque ça n'est pas nécessaire. (while let peuvent s'avérer très utiles lorsqu'il faut tester à chaque itération si le fichier contient toujours quelque chose)

[Exemple de la documentation officielle]



```rust
let mut v = vec![1, 3, 5, 7, 11];
while let Some(x) = v.pop() {
    println!("{}", x);
}
```

## Mécaniques et philosophies

### Gestion de la mémoire

#### Le développeur doit-il gérer la mémoire seul ?

Cette FAQ dispose de trois Q/R abordant trois concepts distincts (mais se complétant) gravitant autour de la gestion de la mémoire avec le langage Rust.

Par souci de concision, les Q/R ci-dessous ne retiennent que l'essentiel de chaque concepts :


1.  [Qu'est-ce que « l'ownership » ?](#LII-B-1-b "Qu'est-ce que « l'ownership » ?") 
2.  [Qu'est-ce que le concept de « borrowing » ?](#LII-B-1-c "Qu'est-ce que le concept de « borrowing » ?") 
3.  [Qu'est-ce que le concept de « lifetime » ?](#LII-B-1-d "Qu'est-ce que le concept de « lifetime » ?") 

#### Qu'est-ce que « l'ownership » ?

Si l'on fait abstraction du contexte dans lequel est employé ce terme (en l'occurrence, la programmation), nous pourrions le traduire de cette façon : « propriété », « possession ».

Nous verrons un peu plus bas que le fonctionnement de ce mécanisme n'est pas si étranger au sens littéral du terme.

**Introduction**

Rust est muni d'un système « d'appartenance » qui permet d'écarter les conflits les plus communs lorsqu'une ressource est utilisée à plusieurs endroits.

Bien que ce dernier soit très pratique, il demande d'avoir une certaine rigueur quant à la déclaration de nos ressources, sans quoi vous risqueriez de vous attirer les foudres du compilateur.

Pour cela, voici un exemple d'erreur typique lorsque l'on débute sans réellement connaître les tâches effectuées par le « ramasse-miette » :



```rust
fn main()
{
    let foo : String = String::from("Hello world!");
    let bar : String = foo;
    let baz : String = foo; //erreur la ressource a été « déplacée »
}
```

Renvoyant une erreur de ce style :



```rust
error: use of moved value: `foo`
```

C'est un exemple simple, mais qui (dans nos débuts) peut être une véritable plaie : on ne comprend pas d'où vient l'erreur - tout est syntaxiquement correct, mais le compilateur n'a pas l'air satisfait.

C'est simple :

La variable foo étant un pointeur contenant l'adresse mémoire d'un objet String, il est courant de dire qu'il possède « l'ownership », il est le seul à pouvoir utiliser cette ressource.

C'est en copiant les informations relatives à l'objet String (en « déplacant » ces informations dans une nouvelle variable, donc) que le *garbage* *collector* va faire son travail : détruire le pointeur *foo* pour attribuer « l'ownership » au nouveau pointeur de la ressource : *bar*.

C'est lorsque la variable *baz* essaie de copier les informations de *foo* que l'erreur survient : *foo* a déjà été détruit par le *garbage* *collector*.

Pour remédier au problème, il aurait simplement suffit de copier *bar* de cette manière :



```rust
fn main()
{
    let foo : String = String::from("Hello world!");
    let bar : String = foo;
    let baz : String = bar;
}
```

Tout est en règle, le compilateur ne râle plus, et si vous souhaitez afficher votre chaîne de caractères sur la sortie standard, rien ne vous en empêche !

Vous pouvez très bien écrire ceci :



```rust
fn main()
{
    let foo = 42;
    let bar = foo;
    let baz = foo;
}
```

La ressource (*foo*) étant statique, le problème de pointeur/référence périmés ne se pose pas.

**Quid des fonctions ?**

Les fonctions obéissent aux mêmes règles que les pointeurs :

Lorsqu'une ressource est passée en paramètre par copie, la fonction « possède » la ressource, même lorsqu'elle a terminé de s'exécuter.

Exemple :



```rust
fn my_func(my_string: String)
{
    let chars = my_string.chars();
    for letter in chars 
    {
        println!("{}", &letter);
    }
}
fn main()
{
    let foo : String = String::from("The cake is a lie!");
    my_func(foo);
    
    let chars = foo.chars(); //error
    
}
```

Vous remarquerez donc ici que le pointeur **foo** a été détruit, la copie de la chaîne de caractères appartient désormais à la fonction.

Voir aussi : [Qu'est-ce que le concept de « borrowing » ?](#LII-B-1-c "Qu'est-ce que le concept de « borrowing » ?")

#### Qu'est-ce que le concept de « borrowing » ?

Il est courant de devoir partager une ressource entre plusieurs pointeurs pour effectuer diverses tâches.

Toutefois, plus une ressource est sollicitée, plus il y a de chance qu'elle soit *désynchronisée/invalidée* à un moment ou un autre. (c'est encore plus fréquent lorsque cette dernière est sollicitée par plusieurs fils d'exécution)

Rust remédie à ce problème grâce au « borrow checking », un système d'emprunts créant en quelque sorte des *mutex* chargés de limiter l'accès à une ressource et ainsi éviter les risques d'écritures simultanées.

Le borrow checker fera respecter ces trois règles (que vous pouvez retrouver dans la documentation officielle) :


1. Une (ou plusieurs) variable peut emprunter la ressource en lecture. (référence immuable)
2. Un, et **seulement un**, pointeur peut disposer d'un accès en écriture sur la ressource.
3. Vous ne pouvez pas accéder à la ressource en lecture et en écriture en même temps, exemple :



```rust
fn main() 
{
    let mut foo = 117;
    let bar = &mut foo;
    let baz = &foo; //erreur

}
```

Ou :



```rust
fn main() 
{
    let mut foo = 117;
    let bar = &mut foo;
    let baz = &mut foo; //erreur
}
```

#### Qu'est-ce que le concept de « lifetime » ?

**Introduction**

Comme tous langages (sauf exception que nous pourrions ignorer), Rust dispose d'un système de durée de vie.

Toutefois, il fait preuve d'une grande rigourosité quant à la destruction des ressources dynamiques et à « l'isolement » des ressources statiques après utilisation.

Voici un exemple :



```rust
fn main()
{
    let mut foo : String = "Hello world!".to_string(); //Le scope A commence ici
    let bar : String = "Goodbye, friend !".to_string();//Le scope B commence ici
    foo = bar;// bar détruit, le scope B s'arrête là
    println!("{}", &bar);
} // Le Scope A s'arrête ici
```

On remarque à la suite de cet exemple que le concept de « scope » (contexte) n'est pas à l'échelle d'une fonction, mais bien des variables, incitant le développeur à déclarer et initialiser sa ressource uniquement lorsqu'il en a besoin.

**Quid des références ? **

Le concept de durée de vie dédiée aux références peut parfois dérouter, surtout lorsqu'il faut expliciter certains tags (représentants des durées de vie) au compilateur lorsqu'il nous l'impose et que l'on ne comprend pas bien pourquoi.

Les références n'échappent pas à la règle, elles aussi ont des durées vie bien déterminées ; En règle générale, il n'est pas utile (voire interdit) au développeur d'expliciter les tags qui permettent au compilateur de « suivre » chaque référence durant son utilisation.

Cependant, lorsque l'une d'elles est passée en paramètre à une fonction, il peut parfois être nécessaire de tagger celles qui survivront au moins à l'exécution de la fonction. (ne serait-ce que par souci de clareté)

Voici un exemple qui pourrait vous épauler : (attention à bien lire les commentaires)



```rust
fn foo(phrase: &str) -> () //aucune référence ne survi, donc pas la peine de l'annoter
{
    println!("{}", &phrase);
}

fn bar<'a>(phrase: &'a mut String, word: &str) -> &'a String //une référence va survivre il faut maintenant savoir laquelle
{
    phrase.push_str(word);
    return phrase;
}//La référence qui survivra sera donc « phrase », elle dispose donc de la durée de vie 'a.

fn main()
{
  let mut baz  : String = "Hello ".to_string();
  let word : &str   = "world!";
  let bazz = bar(&mut baz, word); //ce que contient la varialbe bazz est intouchable
  println!("{}", &bazz); //nous affichons nos caractères sur la sortie standard
}
```

En revanche, ce n'est pas un cas commun, nous vous invitons donc à vous tourner vers la documentation officielle ou à expérimenter par vous-même.

**Que faut-il retenir ?**

Pour faire simple, il faut retenir que :


* Chaque variable créé un nouveau scope lors de sa déclaration ;
* Toutes variables retrouvées dans le scope d'une autre verra sa durée de vie plus courte que cette dernière ;
* A propos des références passées en paramètres, seules les références survivant au moins à la fin de l'exécution de la fonction devraient être annotées.

Voir aussi :

[Le Rustonomicon](https://doc.rust-lang.org/nomicon/lifetimes.html)

[La section dédiée du livre](https://doc.rust-lang.org/book/lifetimes.html)

#### Comment étendre un trait sur un autre trait ?

## Outils de build

### Comment créer un projet avec Cargo ?

Pour créer un nouveau projet avec Cargo, vérifiez d'abord qu'il est *installé* sur votre machine :

`$ cargo -V`

Puis :

`$ cargo new nom_de_votre_repertoire`

Vous devriez voir se générer un dossier avec le nom assigné dans lequel se trouvera un répertoire nommé src et un manifest nommé *Cargo.toml*.

### Quel type de projet puis-je créer avec Cargo ?

Lorsque vous lancez la commande de génération (telle qu'elle), votre projet est généré en mode « bibliothèque », et n'est donc pas destiné à être directement exécuté.

Si vous souhaitez générer un projet en mode « exécutable », il suffit de le préciser dans la commande :

`$ cargo new folder_name  --bin`

Par défaut, le nom du répertoire racine sera également le nom de votre bibliothèque si elle devait être identifiée par d'autres utilisateurs dans le but de la télécharger. Si vous souhaitez lui attribuer un autre nom, vous pouvez également le spécifier dans la commande :

`$ cargo new folder_name --name another_name  --bin`

Le manifest sera modifié en conséquence.

### Comment compiler son projet ?

Pour compiler votre projet, vous devez vous trouver à la racine de ce dernier.

Une fois que c'est fait, il vous suffit de lancer la commande suivante :

`$ cargo build`

### Peut-on générer de la documentation avec Cargo ?

Bien sûr !

Il suffit de lancer la commande $ cargo doc à la racine de votre projet.

La documentation se trouvera dans le dossier `./target/doc/…`

**Où est l'index de mon site ?**

Il se trouve dans le répertoire portant le nom de votre projet.

### Où trouver de nouvelles bibliothèques ?

Vous pouvez trouver d'autres bibliothèques sur le [site officiel](https://crates.io/crates) de Cargo.

Voir aussi : [Comment installer de nouvelles bibliothèques ?](#LII-C-6 "Comment installer de nouvelles bibliothèques ?")

### Comment installer de nouvelles bibliothèques ?

Il y a deux manières de faire :


1. Les télécharger à partir de [crate.io](https://crates.io/crates) ;
2. Les télécharger directement à partir de leur dépôt github.

C'est selon vos préférences. (et surtout selon la disponibilité de la ressource)

Donc pour la première façon, rien de plus simple :


* Vous cherchez la bibliothèque que vous désirez sur le site ;
* Vous renseignez son nom dans votre manifest ;
* Compilez ;
* C'est prêt !

Pour la seconde :


* Cherchez le dépôt github de la bibliothèque désirée ;
* Notez le nom que porte cette bibliothèque dans son manifest ;
* Puis ajoutez cette ligne dans vos dépendences : `lib_name = {git = "url du dépôt" }` ;
* Compilez ;
* C'est prêt !

### Comment publier sa bibliothèque faite-maison ?

Les procédures étant très bien expliquées sur le site de [crates.io](http://crates.io/), nous vous invitons à vous rendre dans la [section dédiée](http://doc.crates.io/crates-io.html).

Si vous souhaitez malgré tout lire les procédures sur la FAQ, en voici une traduction :

Une fois que vous avez une bibliothèque que vous souhaiteriez partager avec le reste du monde, il est temps de la publier sur [crates.io](http://crates.io/) !

La publication d'un paquet est effective lorsqu'il est uploadé pour être hébergé par [crates.io](http://crates.io/).

**Avant votre première publication**

Premièrement, vous allez avoir besoin d'un compte sur crates.io pour recevoir un « token » (jeton) provenant de l'API. Pour faire ceci, visitez la page d'accueil et enregistrez-vous via votre compte Github. Ensuite, rendez-vous dans vos options de compte, et lancez la commande $ cargo login suivi de votre token.



```bash
$ cargo login abcdefghijklmnopqrstuvwxyz012345
```

Cette commande va informer Cargo que vous détenez un token provenant de l'API du site. (il est enregistré dans le chemin suivant : ~/.cargo/config.)

Ce token doit rester secret et ne devrait être partagé avec personne. Si vous le perdez d'une quelconque manière, régénérez-le immédiatement.

**Avant la publication du paquet**

Gardez en tête que le nom de chaque paquet est alloué en respectant la règle du « premier arrivé, premier servi ». Une fois que vous avez choisi un nom, il ne pourra plus être utilisé pour un autre paquet.

**Empaqueter le projet**

La prochaine étape consiste à empaqueter votre projet de manière à être intelligible pour crates.io. Pour remédier à cela, nous allons utiliser la commande cargo package. Votre projet sera donc empaqueter sous la format *.crate et se trouvera dans le répertoire target/package/.



```bash
$ cargo package
```

En plus de cela, la commande package est capable de vérifier l'intégrité de votre projet en dépaquetant votre *.crate et le recompiler. Si la phase de vérification se passe sans problème, rien ne devrait être affiché dans votre terminal.

Toutefois, si vous souhaitez désactiver cette vérification avant l'envoi, il vous suffit d'ajouter le flag --no-verify.

Cargo va ignorer automatiquement tous les fichiers ignorés par votre système de versionning, mais si vous voulez spécifier un type de fichiers en particulier, vous pouvez utiliser le mot-clé exclude dans votre manifest :

[Exemple tiré de la [documentation officielle](http://doc.crates.io/crates-io.html) de l'outil]



```text
[package]
# ...
exclude = [
    "public/assets/*",
    "videos/*",
]
```

La syntaxe de chaque élément dans ce tableau est ce que glob accepte. Si vous souhaitez créer une whitelist au lieu d'une blacklist, vous pouvez utiliser le mot-clé include.

[Exemple tiré de la [documentation officielle](http://doc.crates.io/crates-io.html) de l'outil]



```text
[package]
# ...
include = [
    "**/*.rs",
    "Cargo.toml",
]
```

Maintenant que nous avons un fichier *.crate prêt à y aller, il peut être uploadé sur crates.io grâce à la commande cargo publish. C'est tout, vous venez de publier votre premier paquet !



```bash
$ cargo publish
```

Si vous venez à oublier de lancer la commande cargo package, cargo publish le fera à votre place et vérifiera l'intégrité de votre projet avant de lancer l'étape de publication.

### Comment lancer des tests avec Cargo ?

Pour lancer un test avec cargo, il vous faudra utiliser l'attribut `#[test]` et, évidemment, la commande `$ cargo test`.

Voici un exemple simple de tests :



```rust
#[cfg(test)]
mod oo_tests
{
    struct Alice;
    use loggers_pack::oop::Logger;
    impl Logger for Alice{/*...*/}

    #[test]
    fn pack_logger_oop_info()
    {
        Alice::info("@Alice", "Hello, I'm Alice ", "Peterson !");
    }

    #[test]
    fn pack_logger_oop_wan()
    {
        Alice::warn("@Alice", "Hello, I'm Alice ", "Peterson !");
    }

    #[test]
    fn pack_logger_oop_error()
    {
        Alice::error("@Alice", "Hello, I'm Alice ", "Peterson !");
    }

    #[test]
    fn pack_logger_oop_success()
    {
        Alice::success("@Alice", "Hello, I'm Alice ", "Peterson !");
    }
}
```

Chaque fonction annotée par l'attribut `#[test]` sera compilée durant la phase de test.

### Comment mettre à jour mes bibliothèques ?

Pour mettre à jour vos dépendences, il vous suffit d'utiliser la commande : `$ cargo update`.

Vous pouvez également préciser quelle bibliothèque mettre à jour séparément en utilisation l'option `$ cargo update --precise nom_dep`

### Comment créer ses benchmarks avec Cargo ?

## Gestion des erreurs

### Comment s'effectue la gestion des erreurs avec Rust ?

Tout comme les langages impératifs classiques (e.g. C), Rust ne gère pas les erreurs grâce à un système « d'exceptions » comme nous pourrions retrouver dans des langages plus orientés objets, mais grâce au contenu renvoyé en sortie de fonction.

Plusieurs fonctions (et macros) sont d'ailleurs dédiées à cette gestion (e.g. panic!, unwrap (et ses dérivés), and_then) permettant ainsi de rattraper (d'une manière plus ou moins fine) la situation lorsque les conditions imposées par vos soins ne sont pas respectées.

Cette section regroupe donc un certain nombre de Q/R qui pourrait vous aider à mieux cerner ce système de gestion :


*  [A quoi sert la macro panic! ?](#LII-D-4 "A quoi sert la macro panic ! ?") 
*  [A quoi sert la fonction unwrap ?](#LII-D-5 "A quoi sert la fonction unwrap ?") 
*  [A quoi sert la fonction unwrap_or ?](#LII-D-6 "A quoi sert la fonction unwrap_or ?") 
*  [A quoi sert la fonction unwrap_or_else ?](#LII-D-7 "A quoi sert la fonction unwrap_or_else ?") 
*  [A quoi sert la fonction map ?](#LII-D-8 "A quoi sert la fonction map ?") 
*  [A quoi sert la fonction and_then ?](#LII-D-9 "A quoi sert la fonction and_then ?") 
*  [A quoi sert la macro try! ?](#LII-D-10 "A quoi sert la macro try! ?") 
*  [Comment utiliser la macro assert! ?](#LII-D-11 "Comment utiliser la macro assert! ?") 
*  [Comment utiliser la macro assert_eq! ?](#LII-D-12 "Comment utiliser la macro assert_eq! ?") 
*  [Comment utiliser la macro debug_assert! ?](#LII-D-13 "Comment utiliser la macro debug_assert! ?") 

### Comment créer un type spécifique d'exceptions ?

Il n'est pas possible de créer de créer une structure censée représenter un type d'erreur, comme nous pourrions le faire en Java ; Rust ne gère pas les potentielles de cette manière.

Voir aussi :

Comment s'effectue la gestion des erreurs avec Rust ?

### Est-il possible de créer des assertions ?

Oui, bien entendu.

Il existe trois assertions différentes en Rust (toutes encapsulées par une macro) :


1. [assert](https://doc.rust-lang.org/std/macro.assert!.html "Ouvrir un nouvel onglet")!;
2. [assert_eq](https://doc.rust-lang.org/std/macro.assert_eq!.html "Ouvrir un nouvel onglet")!;
3. [debug_assert](https://doc.rust-lang.org/std/macro.debug_assert!.html "Ouvrir un nouvel onglet")!.

Voir aussi :


*  [Comment utiliser la macro assert! ?](#LII-D-11 "Comment utiliser la macro assert! ?") 
*  [Comment utiliser la macro assert_eq! ?](#LII-D-12 "Comment utiliser la macro assert_eq! ?") 
*  [Comment utiliser la macro debug_assert! ?](#LII-D-13 "Comment utiliser la macro debug_assert! ?") 

### A quoi sert la macro panic ! ?

### A quoi sert la fonction unwrap ?

### A quoi sert la fonction unwrap_or ?

### A quoi sert la fonction unwrap_or_else ?

### A quoi sert la fonction map ?

### A quoi sert la fonction and_then ?

### A quoi sert la macro try! ?

### Comment utiliser la macro assert! ?

La macro assert! capture deux types « d'expressions » différents :

Les expressions à proprement parler, qui pourraient être illustrées par les exemples suivants :



```rust
2 * 2, if … else …, foo() ;
```

Les « tokens tree » qui pourraient être illustrés par n'importe quoi d'autres figurant dans la syntaxe du langage. (puisque, dans l'absolu, le compilateur représente tout ce qui est rédigé dans les fichiers sources grâce à une nomenclature bien à lui)

Donc si nous récupérons le code source raccourci de la documentation, cela donne ceci :



```rust
macro_rules! assert {
    ( $ cond : expr ) => { ... };
    (
$ cond : expr , $ ( $ arg : tt ) + ) => { ... };
}
```

Si certaines choses vous échappent, n'hésitez pas à vous rendre sur les liens proposés en bas de cette Q/R.

**A quoi sert le second paramètre ?**

Le second peut, par exemple, accueillir un message personnalisé pour la macro panic! facilitant ainsi le débogage.



```rust
fn foo(arg: Option<String>) -> ()
{
    let bar : String = String::from("Hello world!");
    let mut some : Option<String> = None;
    assert!(!arg.is_none(), "Arg is None");
    assert!(arg.unwrap().eq(&bar), "arg n'est pas égal à bar");
}

fn main() -> ()
{
    foo(Some("Ok".to_string()));
    foo(None);
}
```

Voir aussi :


* [Visionner le résultat de l'exemple](https://is.gd/wsqrbp "Ouvrir un nouvel onglet") (requiert une connexion internet)
* Comment utiliser une macro ?
* [macro]Antisèche des sous-types

### Comment utiliser la macro assert_eq! ?

« assert_eq! » est un dérivé de la macro « assert! » et permet de tester directement l'égalité de deux objetsLe terme « objet » est ici utilisé pour désigner toutes les entités pouvant être comparées à d'autres. (cela ne concerne donc pas que les instances des structures).

Bien entendu, elle hérite également du message personnalisé pour la macro « panic! ».



```rust
fn foo(arg: Option<String>) -> ()
{
    let bar : String = String::from("Hello world!");
    let mut some : Option<String> = None;
    assert!(!arg.is_none(), "Arg is None");
    assert_eq!(arg.unwrap(), bar, "arg n'est pas égal à bar");
}

fn main() -> ()
{
    foo(Some("Ok".to_string()));
    foo(None);
}
```

Voir aussi :


*  [Visionner le résultat de l'exemple (requiert une connexion internet)](https://is.gd/en8FRZ "Ouvrir un nouvel onglet") 
*  [Comment utiliser une macro ?](#LII-A-33 "Comment utiliser une macro ?") 
* [macro]Antisèche des sous-types

### Comment utiliser la macro debug_assert! ?

**Où puis-je l'utiliser ?**

« debug_assert! » ainsi que ses dérivés (« debug_assert_eq! ») ne sont compilées que lorsque le code source est compilé en mode débug. (mode par défaut de rustc)

Vous ne devez pas compter sur ces assertions pour contrôler le flux de votre programme en production, assurez-vous toujours d'avoir une assertion compilée en mode release.

**Comment l'utiliser ?**

En dehors du contexte dans lequel ces assertions doivent être déclarées, la manière dont elles sont utilisées ne changent pas.

Voir aussi :


*  [Comment utiliser la macro assert! ?](#LII-D-11 "Comment utiliser la macro assert! ?") 
*  [Comment utiliser la macro assert_eq! ?](#LII-D-12 "Comment utiliser la macro assert_eq! ?") 
*  [Comment utiliser une macro ?](#LII-A-33 "Comment utiliser une macro ?") 

## Meta-données

## I/O

## Antisèches Rust
