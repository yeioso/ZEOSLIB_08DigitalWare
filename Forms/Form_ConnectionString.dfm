object FrForm_ConnectionString: TFrForm_ConnectionString
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FrForm_ConnectionString'
  ClientHeight = 344
  ClientWidth = 756
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 756
    Height = 344
    Align = alClient
    TabOrder = 0
    object GrupoConnection: TGroupBox
      Left = 1
      Top = 1
      Width = 754
      Height = 273
      Align = alTop
      Caption = 'Configuraci'#243'n de la cadena de conexi'#243'n'
      TabOrder = 0
      object Panel2: TPanel
        Left = 2
        Top = 15
        Width = 750
        Height = 256
        Align = alClient
        TabOrder = 0
        object MemoConnectionString: TMemo
          Left = 1
          Top = 1
          Width = 748
          Height = 200
          Align = alTop
          Lines.Strings = (
            'MemoConnectionString')
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object pfTipoConexion: TRadioGroup
          Left = 1
          Top = 201
          Width = 748
          Height = 54
          Align = alClient
          Caption = 'Tipo de Conexi'#243'n'
          Columns = 5
          ItemIndex = 0
          Items.Strings = (
            'MSSQL'
            'FIREBIRD')
          TabOrder = 1
        end
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 277
      Width = 754
      Height = 66
      Align = alBottom
      Caption = 'Panel3'
      TabOrder = 1
      object BtnConnectionString: TSpeedButton
        Left = 1
        Top = 1
        Width = 150
        Height = 64
        Cursor = crHandPoint
        Align = alLeft
        Caption = 'Generar cadena de conexi'#243'n'
        Glyph.Data = {
          360C0000424D360C000000000000360000002800000020000000200000000100
          180000000000000C0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFEFEFEFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8D8D88585855756
          58423D42403B4138383D39393E413C41585658888888DEDEDEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D5D56E6D6E524C524A494D395D
          3C2F6F3127792A8E9758979360336F33445F434F4950524D53727272DDDDDDFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E8E8E534E534B4F4B2C772C61A83ABCC1
          63DBC771C7C069D0C36FE6C877399E28249C1E2D9A243A78344D4D4D4F4D5199
          9999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF6F6F6F5149523E6C3A1E99199BB552EDCA80E3CA
          83E2CA86E3C984DFC77CDEC373E3C57572A94221941E279A20279A2078775545
          464D797979FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF6F6F6F5148523781311F99189ABC6DF4DAB0E8D9AFE9DA
          AFE9DAAFE9DAAFE8D9AEE9D8ACE6D39CEBCB87D2BF6D73A9431A941BDCCB72A9
          986843444B7A7A7AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF8E8E8E514952378131279A1E60A948F9DEB8E8D8ABE8D8ABEDDC
          AEF3E2B2EFDEAFE8D8ABE7D8ABE8D8ACE8D9AFE9D6A4E7C87FDFC375DFC477E6
          CC77A997674A484E9D9D9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFD6D6D6534E533E6D3A2D9D2222931CBECA8DEDDAAFE9D9ACEDDCAEA69D
          82454547898270F4E3B2EADAACE9D9ACE9D9ACE8D8ACE9DAB0E2CB88DDC372E0
          C477C1C466356339534F54E3E3E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF6F6F6F4B4F4B2D9C212D992427961FEFDAB0E9D9ACE9D9ACF3E2B24847
          4851595C3F3C3F6B675EF0DFAFEBDBADE9D9ACE7D7AAEBD9ADF2DDB7EFD194E4
          C577B6BB6221981D4D4C4D797979FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          DBDBDB524C523A79342D9C231E9318A8C27DEFDBB1E9D9ACE9D9ACEFDEAF8881
          7045474881B0BA403D3E565451E3D4A8EDDDAFEEDAAFE2D6A770AE542C9926AF
          B760D9C3741F991C3B7336534E53EAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          8888884F49502E9B2422941B84B663F6DCB5E9D8ACF1DBB1F4DCB4E8D8ABF2E1
          B0534F4D6A7A7993D5E5434346484747D7C6A1BBCD8A23941D26951E21941CDC
          D3A1ECC77A359A272D9626504951959595FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          5A575A435F421F991878B25AF9DDB7EFDAB0E7D8AA73B0572F9924F4DCB4ECDC
          AED4C6A03633379FCAC890D9EB474E5348414635812F2A9D20209319C0CB8FEE
          DBB2ECD09364A53A289D20475846636263FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          403D4141723B81B960F8DDB7F8DDB6A5C27C26951E22941B6AAD50F1DBB2E9D9
          ACF2E1B19B937C3F3F41C6FFFF8ED9EF4E5E664B3E46377333D0D899F1DCB2E9
          D8ACF1DAAE87AD4B269B1F3F6A3B474448FFFFFFFFFFFFFFFFFFFFFFFFFEFEFE
          37383AB1A48AF7E1B6F3DCB464AA4B21941B2E982426961EA0BF77EEDAAFE9D9
          ACE9D9ACF5E3B3615C55697C7DCEFFFF8DDAF256727F443B3F867E70F7E5B4E2
          D7A7E7D8AB57A43B2A9B213B74363F3A3FFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD
          353639B4A98BF9E1B651A43D25941E2D97232E972427951F87B665F0DAB1E7D7
          AAE7D7AAE9D9ACE2D2A73A3738A0D0D0C8FFFF8BD9F15E889A433C3C4559431D
          961720941A2B96222D9A233A78353D383EFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE
          38383BB3A48B8DBC6923951C2F99252E97242F99252C9823409E32F7DDB6E9D9
          ACEADAADEEDEAFF7E5B4BBAF8F444749C3FFFFC5FFFF89D5EE649CB34840414A
          50482E95262E9B242E9C233B74363F3A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          3C3D3FA09180349E282D98242F99252E97242F99252F99251F9319D5D19DEEDD
          B0DDCEA4A79E837F796A56534F403A3A6F8383C3FFFFC5FFFF85D2EA6AACC84C
          494B4B4748328D292CA02140693C4B484CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          5B5A5B6C6961289D1F2F99252F99252E97242F99252F992524951DABC47FE4D1
          A93D3F433E3C3E4D52546D84848DB2B4A9DEDEBFFFFFBFFFFFC4FFFF84CEE76F
          B8D74E54584B414834872D485846656465FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          8E8E8E4F49502F99252E98242E97242E98242E97242E972421931BBDCA8BD1C1
          9D36353A83A6A8D1FFFFC4FFFFC2FFFFBFFFFFBEFEFEBFFFFEC1FFFFC7FFFF87
          D0E774C1E355636B4B42454E4E4E9D9C9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          E5E5E5524D533B7536279A1E2C98232E97242F99252A97212F9825F4DCB3F1E0
          B098907A353236748989C7FFFFC0FFFFBFFFFFBFFEFEACEFF69AE0EE87D0E67A
          C5E175C4E479CFF25C7D8A4D4B4AC4C4C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF7575754D4C4C90BD6A48A13722941C1E921848A037D5D29DEBD8ADE9D9
          ACF4E3B2B8AD8E3B383C5C6666C1FFFFC2FFFF77C0DD6DB9DA71BEDE73C1E26B
          A3BA5E839153636A4B4A49545353DADADAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFE3E3E34D4D4F877D71FFE8BCF6DDB4F3DBB3F5DDB5ECDAAEE7D7AAE9D9
          ACE9D9ACF0DFB0D2C59F4644454A4C4DB5F0F0C4FFFF78C3E169A5BE453A3649
          44424A48444A4948525151D2D2D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF9E9E9E444649A79D84F3E2B2E8D8ABE7D7AAE7D7AAE8D8ABE7D7
          AAE7D7AAE7D7AAECDBADE6D6A9635A59453E42A3D3D3C4FFFF77C7E65A778349
          44443F6C3C514E51ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF7D7D7D424447A59C82F6E4B3EADAACE9D9ACE7D7AAE9D9
          ACE9D9ACE9D9ACE7D7AAF4DEB471B3533D5C3C44373E8CAFAFC3FFFF74C4E64E
          54574E4A4C898989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF7E7E7E4546497B7769EBDBACF1E0B1E9D9ABE9D9
          ACE9D9ACE9D9ACE7D7AAF3DCB35FA9481F9B173D6F38433A3F738887BFFFFF6D
          B2CF4A44427D7D7DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA3A3A34C4C4E49494A989079E2D2A8F5E4
          B3F1E0B0EFDEB0EDDDAEF0DFB0F6E1B490C16B3E9D31445A414843455F6968B4
          FBFF608EA24E4846B0B0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E97E7E7F4B4C4E434447605E
          598780709C947CA49B819A927C867E70655F5C4F475052505281818153515152
          5352A4E7F15367714F4C4CE8E8E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F0A2A2A27373
          735859594C4C4E494A4C4C4D4E58595A757576A7A7A7F5F5F5FFFFFFEAEAEA5F
          5E5E4B484788BCC64D5253656565FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
          FEFE7171714C47465F74794E4D4CADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF838383444343474747D2D2D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF3F3F3F6F6F6FFFFFFFFFFFFFFFFFFFFFFFF}
        Layout = blGlyphTop
        OnClick = BtnConnectionStringClick
        ExplicitTop = -4
        ExplicitHeight = 57
      end
      object BtnProbar: TSpeedButton
        Left = 151
        Top = 1
        Width = 150
        Height = 64
        Cursor = crHandPoint
        Align = alLeft
        Caption = 'Prueba de conexi'#243'n'
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000C40E0000C40E00000000000000000000FAFAFAC1C1C1
          C0C0C0C0C0C0C0C0C0C0C0C0DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFC1C1C1111111414141414141414141313131424242FFFFFFFFFFFFFFFFFF
          FFFFFFDCDCDCBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBFBFBFC1C1C1FBFBFBC0C0C0414141FFFFFFFFFFFFFFFFFFC1C1C1404040FF
          FFFFFFFFFFFFFFFFFFFFFF7F7F7F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
          3F3F3F3F3F3F3F3F3F3F3F3F414141DEDEDEC0C0C0414141FFFFFFFFFFFFFFFF
          FFC1C1C1404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0414141
          FFFFFFFFFFFFFFFFFFC1C1C1404040FFFFFFFFFFFFFFFFFFFFFFFFDCDCDCBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFC1C1C1FB
          FBFBC0C0C0313131C1C1C1C1C1C1C1C1C1919191404040FFFFFFFFFFFFFFFFFF
          FFFFFF7F7F7F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
          3F3F3F3F414141DEDEDEDCDCDC4242424040404040404040404040407E7E7EFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBC2C2C2
          C1C1C1C1C1C1C1C1C1C1C1C1DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFC1C1C1111111404040404040404040313131424242FFFFFFFFFFFFFFFFFF
          FFFFFFDCDCDCC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C1C1C1FBFBFBC0C0C0414141FFFFFF777777B3B3B3C1C1C1404040FF
          FFFFFFFFFFFFFFFFFFFFFF808080414141414141414141414141414141414141
          414141414141414141414141434343DEDEDEC0C0C0414141D2D2D21818181E1E
          1E4D4D4D404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0414141
          6464648D8D8DE9E9E9404040252525EEEEEEFFFFFFFFFFFFFFFFFFDCDCDCC0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C1C1C1FB
          FBFBC0C0C0313131A5A5A5BABABABFBFBF9090900A0A0A232323D0D0D0FFFFFF
          FFFFFF8080804141414141414141414141414141414141414141414141414141
          41414141434343DEDEDEDCDCDC4141413F3F3F3F3F3F3F3F3F3F3F3F7E7E7EA9
          A9A9161616CECECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFE1E1E1F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAC0C0C0
          BFBFBFBFBFBFBFBFBFBFBFBFDCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFC1C1C11010103F3F3F3F3F3F3F3F3F303030424242FFFFFFFFFFFFFFFFFF
          FFFFFFDCDCDCC1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1
          C1C1C1C1C2C2C2FBFBFBC0C0C0414141FFFFFF777777B3B3B3C1C1C1404040FF
          FFFFFFFFFFFFFFFFFFFFFF808080404040404040404040404040404040404040
          404040404040404040404040424242DEDEDEC0C0C0414141D2D2D21818181E1E
          1E4C4C4C404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0414141
          6464648D8D8DE9E9E9414141252525EEEEEEFFFFFFFFFFFFFFFFFFDCDCDCC1C1
          C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C2C2C2FB
          FBFBC0C0C0313131A7A7A7BBBBBBC0C0C09191910A0A0A232323D0D0D0FFFFFF
          FFFFFF8080804040404040404040404040404040404040404040404040404040
          40404040424242DEDEDEDCDCDC4343434141414141414141414141417E7E7EA9
          A9A9161616CECECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFE1E1E1F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        Layout = blGlyphTop
        OnClick = BtnProbarClick
        ExplicitTop = -4
        ExplicitHeight = 57
      end
      object BtnCreacionTablas: TSpeedButton
        Left = 301
        Top = 1
        Width = 150
        Height = 64
        Cursor = crHandPoint
        Align = alLeft
        Caption = 'Creaci'#243'n de tablas'
        Glyph.Data = {
          360C0000424D360C000000000000360000002800000020000000200000000100
          180000000000000C0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF9F9F9D2D2D2ABABABABABABD2D2D2F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF4F4F4E7E7E7F4F4F4FFFFFFFFFF
          FFF0F0F0AAAAAAF0F0F0F0F0F0AAAAAAEFEFEFFFFFFFFFFFFFF4F4F4E7E7E7F4
          F4F4FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFCFCFCE1E1E1A4A4A4A3A3A3B8B8B8F6F6F6FFFF
          FFEAEAEAAAAAAAF0F0F0F0F0F0AAAAAAEAEAEAFFFFFFF6F6F6B8B8B8A3A2A2A4
          A4A4E1E1E1FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF2F2F2A1A0A0D4CFCFE7E4E4A4A4A4CDCDCDDFDF
          DFBBBBBBA5A5A5F0F0F0F0F0F0A5A5A5BBBBBBDFDFDFCDCDCDA4A3A3E6E2E2D3
          CECEA1A0A0F2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF5F5F5A9A8A8E1DBDBE5E0E0E6E4E48281819797
          97B7B7B7E5E5E5F2F2F2F2F2F2E5E5E5B7B7B7969696818181E6E2E2E4DFDFE0
          D9D9A9A8A8F5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFDFDFDD3D3D3CCC6C6E2DCDCE7E2E2EDEAEAEEED
          EDEEEEEEEFEEEEEFEFEFEFEFEFEEEEEEEEEDEDEEECECECE9E9E6E1E1E1DBDBCB
          C5C5D2D2D2FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FCFCFCE9E9E9E6E6E6F7F7F7F8F8F8CACACA979494E3DDDDE6E1E1E5E0E0E7E4
          E4E9E6E6EAE8E8EBE9E9EBE9E9EAE8E8E9E6E6E6E3E3E4DFDFE5E0E0E2DCDC96
          9393CACACAF8F8F8F8F8F8E7E7E7E9E9E9FCFCFCFFFFFFFFFFFFFFFFFFFFFFFF
          E5E5E59692928E8989AEADADBEBEBE908D8DDDD5D5DDD4D4DED7D7E1DADAE3DD
          DDE7E4E3EDECEBF1F0EFF2F0F0EFECECE7E3E3E2DDDDE0DADADDD6D6DCD3D3DD
          D4D4908C8CBEBEBEAEAEAE8D8989959191E5E5E5FFFFFFFFFFFFFFFFFFF8F8F8
          B0AFAFB6A6A6C6B4B4B1A4A4888181D6CBCBD5CACAD7CDCDDAD1D1E4DDDDEFEF
          ECEFF0ECECEBE7EBE8E5EDE9E7F1ECEBF5F1F1F3F0F0E3DDDDD9D0D0D7CCCCD5
          C9C9D6CACA888181B1A4A4C5B3B3B5A4A4B0AFAFF8F8F8FFFFFFFFFFFFF4F4F4
          A29C9CBFABABC2B0B0C7B5B5CEBFBFD0C2C2D1C3C3D3C8C8E8E2E2EAEDE7E0E6
          DCDFE4DAD3D8D0CDD1CBD1D1CEDCD9D8EBE6E5EFE9E8F5F1F1E8E2E2D3C6C6D0
          C2C2CFC1C1CEBEBEC5B4B4C1AFAFBEA9A9A29C9CF4F4F4FFFFFFFFFFFFFCFCFC
          D7D7D7AAA5A5C5B3B3C3B0B0CCBCBCCAB9B9CDBDBDE5DDDDE4E8E0D3E2D1BBCF
          B9A5D3AAC5EBCAE5F7E8EBF9EEDFEFE2CFD8D0D3D1CFEFE8E8F3EEEEE4DCDCCC
          BCBCC9B8B8CBBBBBC2AFAFC4B2B2AAA5A5D6D6D6FCFCFCFFFFFFFFFFFFFFFFFF
          FDFDFDE9E9E9949191C3B1B1C3B1B1C6B4B4D4C7C7E9E9E5BFD6BE9CC49BB7E6
          BAD9F4DBDEF5E1E4F7E7EFFAF0F7FCF8FBFDFBEAF0ECC7C7C5E9E3E2F1EDEDD3
          C6C6C4B3B3C2B0AFC3B0B0949191E8E8E8FDFDFDFFFFFFFFFFFFFFFFFFFFFFFF
          FEFEFEEBEBEB908989BFABABBEAAAAC1AEAEE7E1E1B4C5B191BE91A4E0A5C4EE
          C6CBF0CDD2F2D5DAF4DDE9F9EDF3FCF5F9FDFAFCFDFCEDEEEDC3C0BFDDD5D5E6
          E1E0BEADACBDA9A8BFAAAA908989EBEBEBFEFEFEFFFFFFFFFFFFF8F8F8E4E4E4
          DADADABDBDBD988A8ABCA7A7BBA5A5C3B1B1D5D5D08AB68C72C272ABE5ABB3E8
          B4BBEBBDC3EEC6D2F4D9E9F9ECFDFEFDFFFFFFFFFFFFFFFFFFC9C9C8CDC6C4D9
          D8D4BEB0ACB9A5A3BCA7A7988A8ABDBDBDDADADAE4E4E4F8F8F8DADADA908787
          897F7F867B7BB09B9BBBA5A5BAA4A4C8B9B9A4B39F6AAE6E7AD17A97E0979FE2
          9FA8E5AAB8ECC0D4F2D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E8E8B4AEADC4
          C0BDC4B9B6B9A4A3BBA5A5B09B9B867B7B897F7F908787DADADAC7C7C7BAA4A4
          BAA4A4BAA4A4BDA8A8C3B0B0C7B5B5CFC5C57D9D7C4EAA5174D37481D9818BDC
          8B95DF96A9E4B2F5FBF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9A39D9DB7
          AFAECCC4C2C6B5B4C2B0AFBDA9A8BAA4A4BAA4A4BAA4A4C7C7C7CDCDCDCCBCBC
          D8CCCCDFD5D5E2D9D9E2D9D9E2D9D9D5CECE63926537AB395CCC5C6AD26A74D5
          7483DB86A6DFADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F8F67F7B7B98
          8F8FC0BBBAD4CCCBDBD2D2E1D7D7DFD5D5D8CCCCCCBCBCCDCDCDEBEBEBB4B1B1
          B3B1B1AEABABD6CCCCE5DCDCE5DCDCD5CDCD548D5826AD273CC13C50CA505CCE
          5C6DD5709BDAA3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFACECC15EC17434994939
          974D419D56459F5A47A15D4AA4605AB57073BE84B1B2B0EBEBEBFEFEFEFAFAFA
          F7F7F7DDDDDDB2ACACE7E0E0E7E0E0E0D9D94E8A5220B02122B4213BC33B45C6
          4550CB5174D07FFDFEFDFFFFFFFFFFFFFFFFFFFFFFFFA8E6B93ACC613ACA6243
          CB6446CB6245CB5E3DC95530C54720C0332CBE4AC8DACCFEFEFEFFFFFFFFFFFF
          FFFFFFF0F0F09F9B9BE9E3E3E9E3E3E9E3E36A9B6B21AD2516B41622BB222EBE
          2E23BD2443C34DB8E5BEFFFFFFFFFFFFFFFFFFFFFFFFD7DFD938814532C25528
          C24B33C45045CA5C49CB5E49CB5C49CC5B43C961CBEDD5FFFFFFFFFFFFFFFFFF
          F4F4F4CCCCCC827E7EE9E2E2ECE6E6ECE6E6B1C7AE259C2D1EBA1F20BA2123BB
          251BBB1C0EB7112EA83EC9E5CDFFFFFFFFFFFFD6D6D64E4C4C4B48452F964526
          C0441FBE3B3BC85353D06853D16854D2684ED16ECDF0D7FFFFFFFFFFFFF7F7F7
          B9B8B8979191E6DFDFEFE9E9EFE9E9EFE9E9ECE8E7368B3E2FBF332CBF2F2EC0
          3235C23913B81309B30C1A90266BA47478977D2F4732315A3627853924B33C1A
          BD322DC4445AD5715DD6735ED77460D87655D676C7E4D0FFFFFFFFFFFFF4F4F4
          AAA6A6F1EDEDF1EDEDF1EDEDF1EDEDF1EDEDF1EDED94BC963AAC4239C43F3BC6
          423EC74546CA4D23BE2502B3030CAA10129A1A159C1F17A92313B82112B92133
          C74761D97965DB7E67DD8069DE836CDF865BDA7EC6DFCEFFFFFFFFFFFFFCFCFC
          C7C7C7E0DADAF3EFEFD9D6D6ACAAAAF1EDEDF4F0F0F1EFEE4DA9574EC85848CD
          534BCE574ED05B53D2604BCE562BC23117BB1912B9131BBC2034C74158D76D6B
          DF856EE18971E38D74E59176E69479E89862DE87CEEFD8FFFFFFFFFFFFFFFFFF
          F4F4F4B2B1B1B2B1B1DEDEDEE6E6E6ACAAAAF4F1F1F6F4F4DCE9DB41B24F5FD3
          6D59D66A5CD76E5FD97262DB7665DC7B68DE7F6BE0836EE28871E48C75E69278
          E8977CEA9B81ECA272E19271E1928AF2AF6AE292D2F4DCFFFFFFFFFFFFFFFFFF
          FFFFFFFAFAFAFAFAFAFEFEFEFEFEFEDBDBDB9C9797F9F7F7F9F7F7D8ECDA49C3
          5A6BDB7E6DE0846EE28871E48C74E59077E7957BE99A7EEB9E81EEA384F0A888
          F2AD90F3B363DC869AE5AF9CE6B271E39772E69DD4F4DFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFAFAFABDBDBDCAC4C4FBFAFAFBFAFAFAF8F8EEF7
          EF74D88353D36A80E69988EEA884F0A888F2AD8BF4B28EF6B792F8BC9DF8C27C
          E79F50C36FBCDAC4FFFFFFFFFFFFA2E8B899E7B2E1F7E9FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF1F1F19C9797FCFCFCFEFEFEF7F5F5A3A1A1B1B0
          B0C7C6C6C7DFCA7FDC906BD8808BE5A1ABF0C0B5F4CA9FEDB87FE1996EDA8AAD
          EABD999997F1F1F1FFFFFFFFFFFFFFFFFFEBFAF0FEFEFEFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF7F7F7B2B1B1ECEBEBFEFEFEB1AEAEE9E9E9F8F8
          F8DEDEDEA4A0A0FFFFFFFEFEFEA2A9A1BFC8C1DEEAE1CFD7D1AFB0ADFEFEFEEC
          EBEBB2B1B1F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6D0D0D0B6B4B4D6D6D6FCFCFCFFFF
          FFEDEDEDA6A1A1FFFFFFFFFFFFA6A1A1EDEDEDFFFFFFFCFCFCD7D7D7B6B5B5CF
          CFCFF6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFAFAFAFDFDFDFFFFFFFFFF
          FFF4F4F4AEAAAAFFFFFFFFFFFFAEAAAAF4F4F4FFFFFFFFFFFFFDFDFDFAFAFAFE
          FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFDFDFDEFEFEFE1E1E1E1E1E1EFEFEFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        Layout = blGlyphTop
        OnClick = BtnCreacionTablasClick
        ExplicitTop = -4
        ExplicitHeight = 57
      end
      object BtnAceptar: TSpeedButton
        Left = 451
        Top = 1
        Width = 150
        Height = 64
        Cursor = crHandPoint
        Align = alLeft
        Caption = 'Aceptar'
        Glyph.Data = {
          EE070000424DEE070000000000003600000028000000190000001A0000000100
          180000000000B8070000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFC8E2D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFAED2C276A48E52876C3B765A2C6F5240816750887377
          A493BDE1D3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF55877527674A0E5A381A6D4622
          7E5310734B0D704A0E6A4715674A1D61486AA28DFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FC6B30C53391B
          714F1B7D5322915F128853108B53108E5A0986541592610F835819825D0F6847
          21634AB1DFCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF73B1990053322C8D651A865819925F06874E02884C088E520C9158078C53
          098F5A058B57078554178A5F1978531B6345A5D3C0FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF98C8B0096843198F5F188B59128A540A8B5212985C
          0D8E551190580F8A52148F57128F5712935A0B945C088E59188E5E20835B1862
          44B3E4D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF23694A198D5E119860
          11925712965A0A945A048C52239D671285531D955F138F5915925A0B8F530B98
          590594560A91591992601D7E5630775CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          609B8626805C1995610A96590D99590A995A06995F0E976318845633996F0F8C
          5B0E9662109D640E9A5D129F5C0996530597571099611F97670E6C4984BEA6FF
          FFFFFFFFFFFFFFFFFFFFFFFF1C6B5027966A12975E0B9D5C0D9D5C0C9B5D119A
          66188C616EBD9CFFFFFF58BD970D8759139B670C9B5D109D5A0F9E590DA26005
          985A0C955F28996D297556FFFFFFFFFFFFFFFFFFFF91C8B5278C66129661109E
          5D0CA15D14A567199D682188626FB69CFFFFFFFFFFFFFFFFFF6BBB981F90641B
          A26A0F9F5E0DA35D10A5610BA15F0FA2661697641F7F5AAAE6CEFFFFFFFFFFFF
          FF70B1971E96660EA16310A76112A96304995A1D9A696EBC9DFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF70C0A1218F651FAB7009A4610CA762049F5A0EAA6915A368
          238F6584CBB0FFFFFFFFFFFFFF529F7A199E6507A8620AA75D13AF680CA8683C
          B686FFFFFFFFFFFFFFFFFF6DAE95FFFFFFFFFFFFFFFFFF81C7B01E9A6E0DA96D
          0FB4710CB46D00A65F09A06122976A6BB59BFFFFFFFFFFFFFF51A17C10A16301
          AE6402AD5F0BB36708AE6D24AD7A8EDFBEFFFFFF43AB8837A37F5FB396FFFFFF
          FFFFFFFFFFFF66C9A919A4710AAE6D00AE6306B4670CAA681E9E6F66BB9FFFFF
          FFFFFFFFFF62B19015AB6F05BF7309C2720DC8790EC78313BF852BBB8B3FCA9E
          25BF8E2DCA9830BE935ACAA8FFFFFFFFFFFFFFFFFF7BDBB625BE7F0DC3750EC1
          720FB36C1EAB7A6ACBB0FFFFFFFFFFFFFF81C8AE23B37E07C07806C37407C878
          06C9810BCB8A13C89117CC9515D19612CE9320D59E26BF9260C6AAFFFFFFFFFF
          FF83E3BF19B67615CD7F0FC6761EC47D25AD7D83DEC4FFFFFFFFFFFFFFAAE1D0
          34B38616BD7E12C77C10CE7F07CA8106CC850CCF9110D29612D7990BD2940ACE
          9228DFA724C29448D4AB74F5D036C2931EC8860BC77B12CD7E1EC07E33A67BFF
          FFFFFFFFFFFFFFFFFFFFFFFF50B89527BD8713C78009CE800FD4880DD68D0ED7
          940BD7960FDB9A0EDC9B11E1A106D09318D79E18CD961DC79318C38B19D28E0A
          C98013CC8425BD8263BD9AFFFFFFFFFFFFFFFFFFFFFFFFFF7DCDB040C49510C9
          8700CF830DD98E09D58A0BD78F0AD69308D89705D79705DA9B09DC9D0BD89911
          D89A0FD09111D3910DD38C0ACC8617C8893FC6969EDFC6FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF5BBF9C2CC99616D6950CCF8910D9900ADA9202D6900ADD9B0A
          DD9D00D79603DB9A08DB9908D4910CD89017E19A10D28F1CCC903BCB9B6ACEAB
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EC5A634C2971FCB930D
          D39106DC9500D89103D89303D79503D99809DC9C0BD9980ED9940CD78E10D38B
          1BCB8F47D3A471C9ABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFB7EDE076D2B958DCB428CB9717D29410D99612DA9A10D8980FDA9B10D99A
          14D4951FD89826D89723C68959E0B076D7B5FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF84C7B285E6C65ADAB035CE9B
          24CA931ACB9218CE9422D69C2AD39B2FC7925ADDAB83EBC281C8ADFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFA9DACA88D5BA79DDBA79EEC773F5CC6DF4C86BF0C56FE9C07BE4BF87DA
          BAB9F3DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB1E5D496D1BD91D1
          BBA0DBC6B8EBD7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        Layout = blGlyphTop
        OnClick = BtnAceptarClick
        ExplicitTop = -4
        ExplicitHeight = 57
      end
      object BtnSalir: TSpeedButton
        Left = 601
        Top = 1
        Width = 150
        Height = 64
        Cursor = crHandPoint
        Align = alLeft
        Caption = 'Salir'
        Glyph.Data = {
          360C0000424D360C000000000000360000002800000020000000200000000100
          180000000000000C0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFCFBFC
          FDFDFDFDFDFDFDFDFDFDFCFCFDFBFCFDFBFCFDFBFCFDFBFCFDFBFCFDFBFCFDFB
          FCFDFBFCFDFBFCFDFAFCFDFAFCFDFAFBFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDEFF1F6F4F5
          F8FBFBFBFBFBFBFAFAFAF5F8FAF1F5F9F1F5F9F1F5F9F1F5F9F1F5F9F1F5F9F1
          F5F9F1F5F9F1F5F9F1F5F9F1F4F9F0F3F8FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFDE2E5EEECEE
          F3F8F9F9F7F7F7F6F6F6EEF2F7E7EEF5E7EEF5E7EDF5E7EDF5E7EDF5E7EDF5E7
          EDF4E6EDF4E6EDF4E6EDF4E6EDF4E5EAF2FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFCD4D9E6E4E7
          EEF6F6F6F4F4F4F2F3F3E7EDF4DDE6F1DDE6F1DCE6F0DCE6F0DCE6F0DCE6F0DC
          E5F0DCE5F0DCE5F0DCE5F0DCE5EFD8DFEBFDFDFDFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9FBC7CCDED1D6
          E3F2F2F3F1F1F1EEEEEFDFE6F0D2DEECD1DEECD1DEECD1DDEBD1DDEBD1DDEBD0
          DDEBD0DDEBD0DDEBD0DDEBD1DDEBCAD2E2FDFDFDFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDD2E1B9C0
          D6C5CBDCD0D4E1CED3DFC9D5E5C8D7E7C7D6E7C7D6E7C6D6E7C6D5E6C6D5E6C6
          D5E6C5D3E5C3D0E3C1CEE0BDC7DCD6DAE7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEE9EB
          F2E4E6EFE5E7F0E5E8F0E4E9F1CFDCEAD1DDEBDAE4EFE2EAF2E9EEF5E8ECF3E6
          EAF2E6EAF1E8EBF2E9EBF2EEEFF5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F9AEB6
          D0A0AAC8A0AAC8A1ABC9A0B2D0658EBE6D94C186A6CB9EB9D5B3C6DDB1C1D9AE
          BAD4AAB5D0A9B3CEA8B2CDBDC4D8FCFCFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE3F538F031E
          6D374B855C6A945666903F6CA4386EAB346CAA336BA9336BA8336AA73269A632
          69A62F64A3295B9B235194153B835C6DA1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E4ED031D6D364A
          86C8C8CBC1C2C2B6B7B87194BD366EAC356DAB346CAA346BA9336BA9326AA832
          69A73168A63168A63168A63167A5133881F4F5F8FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFE2EC0321706171
          9CCBCBCCC3C3C3B7B8B97697C0386FAD366EAC356DAB346CAA346CAA336BA932
          6AA83269A73269A73269A73168A61D488EEEF0F5FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFE2EC0423736374
          9FCBCCCCC3C3C3B7B8B97698C03970AE376FAD366EAC356DAB346CAA346CAA33
          6BA9326AA83269A73269A73168A61E4A90EEF0F5FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEE2EC0626766375
          A1CBCCCCC3C3C3B7B8B97798C13A71AF3770AE376FAD366EAC356DAB356DAB34
          6CAA336BA9336AA83269A73168A61E4C92EEF0F6FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3EFE6E2D8C1E4E6E90628796476
          A2CBCCCCC3C3C3B7B8B97799C13A72B03871AF3770AE376FAD366EAC356EAC35
          6DAB346CAA336BA9336AA83168A61F4D93EEF1F6FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDE9E0CCA58131AB9C7B0D2E776578
          A3CCCCCCC3C3C3B7B8B97899C23B73B13972B03871AF3870AE376FAD366FAD35
          6EAC356DAB346CAA336BA93269A71F4E95EEF1F6FFFFFFFFFFFFFFFFFFFFFFFF
          F7F4EEC4AB72C2A96EC2A96EC2A96EC3A86EBEA262AA8535A985349078418488
          94CCCCCBC3C3C3B7B8B9789AC23C74B23A73B13972B03871AF3870AE3770AE36
          6FAD366EAC356DAB346CAA336AA8205097EEF1F6FFFFFFFFFFFFFFFFFFFFFFFF
          EFE8D9B28C3CB28B3AB28B3AB28B3AB28B3AB28B3AB18B3AB18A3AB18A3AB18D
          3FC0AE88C3C3C1B7B8B8789AC33D75B33B74B23A73B13972B03871AF3871AF37
          70AE366FAD366EAC356DAB346BA9215299EEF1F6FFFFFFFFFFFFFFFFFFFFFFFF
          F0E9DAB89040B89140B89140B89140B89140B89140B89140B89140B89140B891
          40B89141BB9E62B8B3AA799BC23E76B43B74B23A73B13972B03972B03971AF38
          71AF3770AE366FAD366EAC346CAA22539AEEF1F7FFFFFFFFFFFFFFFFFFFFFFFF
          F2EADBBE9646BF9646BF9646BF9646BF9646BF9646BF9646BF9646BF9646BF97
          46BF9746C39E51C3A870799BC33D77B5386FAF3166A73A73B13A73B13972B039
          72B03871AF3770AE376FAD356DAB22559CEEF1F7FFFFFFFFFFFFFFFFFFFFFFFF
          F3EBDCC69C4DC69C4CC69C4CC69C4CC69C4CC69C4CC69C4CC69C4CC69C4CC69C
          4CD0AC62CFB98BB8B6B17A9CC33E78B51B468F082A793B74B23B74B23A73B139
          73B13972B03871AF3770AE366EAC23579EEEF1F7FFFFFFFFFFFFFFFFFFFFFFFF
          F5EEE0D1AA5DD0A659D0A659D0A659D0A659CFA657CDA252CCA252CDA355D9B9
          77D0C3A8C4C3C2B8B8B97A9CC43F79B62B62A81D52A03C75B33C75B33B74B23A
          74B23A73B13972B03871AF376FAD2457A0EEF2F7FFFFFFFFFFFFFFFFFFFFFFFF
          FDFCFAF1E2C5F1E3C4F1E3C4F1E3C5F1E3C5ECD8B0D2A759D7AF66B0A07D8290
          A7CCCCCCC4C3C3B8B8B97A9DC5407AB83E78B63D77B53D76B43C76B43C75B33B
          74B23A74B23A73B13972B03870AE2559A2EEF2F7FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEF7EFDFE1BF79CEC4AE1141916882
          B0CCCCCDC3C3C3B8B8B97B9DC6427BB93F7AB83F79B73E78B63D77B53C76B43C
          75B33B75B33A74B23A73B13871AF255BA4EEF2F7FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF8F2F7EFDFE8EBEF0D41966784
          B2CBCCCDC3C3C3B8B8B97B9EC6427CBA407BB93F7AB83F79B73E78B63D77B53D
          76B43C76B43B75B33A74B23972B0265CA6EFF2F8FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E7F10D449A6885
          B3CBCCCDC3C3C3B8B8B97C9EC7437DBB417CBA407BB9407AB83F79B73E78B63D
          77B53D77B53C76B43B75B33A73B1275EA7EFF2F8FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E7F20D469D6886
          B5CBCCCDC3C3C3B8B8B97C9FC7447EBC427DBB417CBA407BB9407AB83F79B73E
          78B63D77B53D77B53C76B43B74B2275FA9EFF2F8FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E7F20E49A06888
          B6CBCCCDC3C3C3B8B8B97C9FC8457FBD437EBC427DBB417CBA407BB9407AB83F
          79B73E78B63E78B63D77B53C75B32861ABEFF2F8FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E7F20E4BA36989
          B8CBCCCDC3C3C3B8B8B97DA0C84680BE437FBD437EBC427DBB417CBA417BB940
          7AB83F79B73E79B73E78B63C76B42963ACEFF3F8FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E8F30F4DA65A7F
          B4CACBCDC3C3C3B8B8B97DA0C94681BF4480BE437FBD437EBC427DBB417CBA41
          7BB9407AB8407AB83F79B73D77B52964AEEFF3F8FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E8F31655AB1953
          A598A6B8BBBDC1B0B3B77BA0C94682C04581BF4580BE447FBD437EBC437DBB42
          7CBA417CBA417BB9427BB9477FBB235FAFEFF3F9FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F7FB346CB91857
          AF104FA7124DA0134EA05586C35C90C94682C04C85C1598EC65F91C95F91C85D
          8FC75689C44F83C24479BE2663B33970BAFCFCFEFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEC3D3EA6893
          CC628FCA628ECA5D8BC95B8BC879A2D378A1D36B97CD5A8AC65C8CC86390CB5E
          8BC95D8AC95C8AC95786C6618ECAC6D6EBFEFEFEFFFFFFFFFFFF}
        Layout = blGlyphTop
        OnClick = BtnSalirClick
        ExplicitTop = -4
        ExplicitHeight = 57
      end
    end
  end
end
