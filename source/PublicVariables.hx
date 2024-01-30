// this is like a thingy where if like multiple hx files use the same thing it gets called from here useful for not needing to add something new to each of them

class PublicVariables
{
  public static var luigiChars:Array<String> = [ // luigi noteskin characters
    'luigi_fountain3d', 'luigi_fountain', 'luigi-toolate'
  ,'luigi-prequel', 'luigi-ldo', 'luigi-ihy-new2'
  ,'luigi-fake', 'luigireal', 'luigiquemao'
  ,'beta', 'betanew'
  ];

  public static var downt:Array<String> = [ // dont overwrite the note types texture if the opponent has a custom note skins
    'Hurt Note', 'Nota veneno', 'Nota boo'
  ,'Coin Note', 'Water Note', 'Nota bomba'
  ,'Bullet', 'jumpscareM', 'Bullet Bill'
  ,'Bullet2', 'Bad Poison'
  ];

  public static var noNoteSplasheSongs:Array<String> = [ // disable enemby notesplashes on these songs
    'Day Out', 'Unbeatable'
  , 'No Party', 'No Party Old'
  ];

  public static var luigiDayOutNoteChange:Bool = false; // changes the notes and splashes to luigi notes and splashes when luigi sings in day out

  public static function changeLuigiNotes()
}