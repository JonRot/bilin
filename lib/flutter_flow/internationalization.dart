import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['pt', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ptText = '',
    String? enText = '',
  }) =>
      [ptText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // auth_Create
  {
    'y4q39ofg': {
      'pt': 'Criar Conta',
      'en': 'Create Account',
    },
    'lw1b9zw6': {
      'pt': 'Bem vindo crie sua conta aqui:',
      'en': 'Welcome create your account here:',
    },
    '103zpks4': {
      'pt': 'Nome',
      'en': 'Name',
    },
    'm5y8y794': {
      'pt': 'Sobrenome',
      'en': 'Surname',
    },
    'h8wq98al': {
      'pt': 'Email',
      'en': 'E-mail',
    },
    'lb12pi7d': {
      'pt': 'Senha',
      'en': 'Password',
    },
    'z1jx9ufm': {
      'pt': 'Criar Conta',
      'en': 'Create Account',
    },
    'ani8a0wd': {
      'pt': 'Ou crie usando:',
      'en': 'Or create using:',
    },
    '2ae7i8c8': {
      'pt': 'Conta Google',
      'en': 'Google Account',
    },
    'duovlbfb': {
      'pt': 'Já tem uma conta?',
      'en': 'Already have an account?',
    },
    'jz694ggu': {
      'pt': ' Clique aqui',
      'en': 'Click here',
    },
    'ry8gfhoz': {
      'pt': 'Nome obrigatório',
      'en': 'Name required',
    },
    'xstwosc8': {
      'pt': 'Nome Invalido',
      'en': 'Invalid Name',
    },
    'dctew2c8': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'j39mqll4': {
      'pt': 'Nome obrigatório',
      'en': 'Name required',
    },
    'j6i8c1io': {
      'pt': 'Sobrenome Invalido',
      'en': 'Invalid Surname',
    },
    'y61obtfa': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'un7td3ag': {
      'pt': 'Email obrigatório',
      'en': 'Email required',
    },
    '4pm3u5eu': {
      'pt': 'Email Invalido',
      'en': 'Invalid Email',
    },
    'syctr86z': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'j6t7j7uc': {
      'pt': 'Senha obrigatória',
      'en': 'Password required',
    },
    'a1j036pw': {
      'pt': 'A senha deve ter 8-20 caracteres',
      'en': 'Password must be 8-20 characters long',
    },
    'fzkbdlj4': {
      'pt': 'A senha deve ter 8-20 caracteres',
      'en': 'Password must be 8-20 characters long',
    },
    'pj7gt3vj': {
      'pt': 'A senha deve incluir maiúscula, minúscula, número e símbolo.',
      'en': 'Password must include uppercase, lowercase, number and symbol.',
    },
    'r896wsqu': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'lopvqoho': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // auth_Login
  {
    '1jklqp5t': {
      'pt': 'Acesse sua conta Bilin',
      'en': 'Access your Bilin account',
    },
    'fjppp7l7': {
      'pt': 'Email',
      'en': 'E-mail',
    },
    'irb7x2py': {
      'pt': 'Senha',
      'en': 'Password',
    },
    'mblrwzoy': {
      'pt': 'Logar',
      'en': 'Login',
    },
    'q13wh729': {
      'pt': 'Continue com o Google',
      'en': 'Continue with Google',
    },
    'uoj0mnz5': {
      'pt': 'Não tem uma conta?  ',
      'en': 'Don\'t have an account?',
    },
    't1geeiix': {
      'pt': 'Crie uma Conta ',
      'en': 'Create an Account',
    },
    'b2c6feqp': {
      'pt': 'Esqueceu sua senha?',
      'en': 'Forgot your password?',
    },
    'bsqgcw2d': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // auth_ForgotPassword
  {
    'h7xhc879': {
      'pt': 'Esqueceu sua Senha?',
      'en': 'Forgot your password?',
    },
    '2rlwojnm': {
      'pt':
          'Insira seu e-mail de recuperação e aguarde o email enviado para você.',
      'en':
          'Enter your recovery email and wait for the email to be sent to you.',
    },
    'rtisf4mj': {
      'pt': 'Email',
      'en': 'E-mail',
    },
    'p78y0m30': {
      'pt': 'Recuperar Senha',
      'en': 'Recover Password',
    },
    'eurgojeq': {
      'pt': 'Voltar',
      'en': 'To go back',
    },
    'elt87rq6': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // auth_Perfil
  {
    'u1rs0lpv': {
      'pt': 'Editar Perfil',
      'en': 'Edit Profile',
    },
    'kv6tcgg1': {
      'pt': 'Criar Disponibilidade',
      'en': 'Create Availability',
    },
    '5nim9yxw': {
      'pt': 'Disponibilidade',
      'en': 'Availability',
    },
    'dmj614ha': {
      'pt': 'Ajustes',
      'en': 'Settings',
    },
    'zjiwnqvd': {
      'pt': 'Ajustes',
      'en': 'Settings',
    },
    'l6n6tvyx': {
      'pt': 'Mandar Notificação',
      'en': 'Settings',
    },
    '2krh3q8w': {
      'pt': 'Sair da Conta',
      'en': 'Log Out',
    },
    'm3mjsiur': {
      'pt': '•',
      'en': '•',
    },
  },
  // auth_EditPerfil
  {
    'g2y9l71k': {
      'pt': 'Perfil',
      'en': 'Profile',
    },
    'uu788aqn': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // auth_Welcome
  {
    'txw83fkx': {
      'pt': '#EnsinoBilin',
      'en': '#BilinTeaching',
    },
    'n2wyksxy': {
      'pt': '#Bilingue',
      'en': '#Bilingual',
    },
    'pm033929': {
      'pt': '#Educação',
      'en': '#Education',
    },
    'se47xdjh': {
      'pt': '#Diversão',
      'en': '#Fun',
    },
    'a1cxougg': {
      'pt': '#Imersão',
      'en': '#Immersion',
    },
    '8n7o3qh6': {
      'pt': '#Inglês',
      'en': '#English',
    },
    '53mu3r14': {
      'pt': 'Bem Vindo ao',
      'en': 'Welcome to',
    },
    'jzogae9p': {
      'pt': 'Ensino Bilin',
      'en': 'Bilin Teaching',
    },
    'xf6dn1up': {
      'pt':
          'Inscreva-se ao \"EnsinoBilin\" para acessar tudo que\nseu filho tem para se tornar Bilin.',
      'en':
          'Sign up to \"EnsinoBilin\" to access everything your child has to become Bilin.',
    },
    'z9qrdx1e': {
      'pt': 'Começar',
      'en': 'To start',
    },
    '0nfpf7ef': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // MainDashboard
  {
    'xb3pxgi7': {
      'pt': 'Bem vindo',
      'en': 'Welcome',
    },
    'v6vteefg': {
      'pt': 'Pais',
      'en': 'Country',
    },
    'kyy5f1vj': {
      'pt': 'Teachers',
      'en': 'Teachers',
    },
    'q9wmhj5s': {
      'pt': 'Admins',
      'en': 'Admins',
    },
    'kqt9ts0j': {
      'pt': 'SEG',
      'en': 'MON',
    },
    'q0xfjbbl': {
      'pt': 'TER',
      'en': 'TO HAVE',
    },
    'lrj3vaxe': {
      'pt': 'QUA',
      'en': 'WED',
    },
    'ea1cbd6n': {
      'pt': 'QUI',
      'en': 'THU',
    },
    'xb1z44fp': {
      'pt': 'SEX',
      'en': 'FRI',
    },
    'j0hh0gc7': {
      'pt': 'Registro de Aulas',
      'en': 'Class Record',
    },
    'xzsch430': {
      'pt': 'Meus filhos:',
      'en': 'My children:',
    },
    '5g31mnbn': {
      'pt': 'Adcionar filho',
      'en': 'Add child',
    },
    'y2bdtyiy': {
      'pt': 'Adcione um aluno bilin',
      'en': 'Add a bilin student',
    },
    'euvfun0b': {
      'pt': 'Agenda:',
      'en': 'Agenda:',
    },
    'gjzou5no': {
      'pt': 'Solicitar Aulas',
      'en': 'Request Classes',
    },
    'c4t4toxe': {
      'pt': 'Clique aqui para solicitar aulas.',
      'en': 'Click here to request classes.',
    },
    '6vfe3001': {
      'pt': 'Proxima aula:',
      'en': 'Next class:',
    },
    'ky41jzzx': {
      'pt': 'Adcione um aluno bilin',
      'en': 'Add a bilin student',
    },
    '984fxc7i': {
      'pt': 'Entre em contato com um Administrador',
      'en': 'Contact an Administrator',
    },
    'vamvr2u0': {
      'pt': '•',
      'en': '•',
    },
  },
  // chat_Details
  {
    '5uymcreq': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // chat_main
  {
    '201o3b8u': {
      'pt': 'Chats',
      'en': 'Chats',
    },
    'w5eeypgc': {
      'pt': '•',
      'en': '•',
    },
  },
  // chat_InviteUsers
  {
    'guwou8mg': {
      'pt': 'inclua ou exclua Pessoas',
      'en': 'include or exclude People',
    },
    '7cubjnib': {
      'pt': 'Selected',
      'en': 'Selected',
    },
    'egy08dpe': {
      'pt': 'Pessoas na conversa',
      'en': 'People in conversation',
    },
    '76an7vqj': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // image_Details
  {
    '6qmowbxe': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // PerfilAlunoBilinCriar
  {
    'd4yaxnvr': {
      'pt': 'Novo Aluno',
      'en': 'New Student',
    },
    'b4j48ts5': {
      'pt': 'Mudar Foto',
      'en': 'Change Photo',
    },
    'pffzpvbd': {
      'pt': 'Nome do Aluno',
      'en': 'Student Name',
    },
    '1azwfode': {
      'pt': 'Nome',
      'en': 'Name',
    },
    'zuda871j': {
      'pt': 'Sobrenome do Aluno',
      'en': 'Student\'s Last Name',
    },
    'f5w7ho2n': {
      'pt': 'Sobrenome',
      'en': 'Surname',
    },
    'bwk4nu65': {
      'pt': 'Data de nascimento',
      'en': 'Date of birth',
    },
    '530l540a': {
      'pt': 'Alergias',
      'en': 'Allergies',
    },
    '3i5buxlj': {
      'pt': 'Alguma alergias?',
      'en': 'Any allergies?',
    },
    '30ff1fcz': {
      'pt': 'Sexo do Aluno?',
      'en': 'Student\'s Gender?',
    },
    'fhrbzx28': {
      'pt': 'Menino',
      'en': 'Boy',
    },
    'p5anjrpe': {
      'pt': 'Menina',
      'en': 'Girl',
    },
    '7xnw7rn5': {
      'pt': 'Aluno vai à Escola?',
      'en': 'Does the student go to school?',
    },
    'w41lylxl': {
      'pt': 'Sim',
      'en': 'Yes',
    },
    '3lnbdrde': {
      'pt': 'Não',
      'en': 'No',
    },
    '0dofqchf': {
      'pt': 'Criar',
      'en': 'To create',
    },
    'kl3shijm': {
      'pt': 'Nome Obrigatório',
      'en': 'Name Required',
    },
    'gdwb8pca': {
      'pt': 'Nome muito curto.',
      'en': 'Name too short.',
    },
    'nehssz92': {
      'pt': 'Nome muito longo.',
      'en': 'Name too long.',
    },
    'mfem80x2': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'acu679tf': {
      'pt': 'Sobrenome Obrigatório',
      'en': 'Field is required',
    },
    'd6xw8v7v': {
      'pt': 'Nome muito curto.',
      'en': 'Name too short.',
    },
    'k3oe1ho5': {
      'pt': 'Nome muito longo.',
      'en': 'Name too long.',
    },
    'rb13r165': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '1o1ay1bi': {
      'pt': 'Obrigatório informar',
      'en': 'Mandatory to inform',
    },
    'zyr3nlfn': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'q4e7qfqw': {
      'pt': 'Field is required',
      'en': 'Field is required',
    },
    'v5e0irnn': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'gqqlsiil': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // SolicitarBookingAdmin
  {
    'xqzwmuwu': {
      'pt': 'Solicitações',
      'en': 'Requests',
    },
    'aue2kd84': {
      'pt': 'Arquivar',
      'en': 'Archive',
    },
    'fc869ivj': {
      'pt': 'Arquivados',
      'en': 'Archived',
    },
    'f2p6r47i': {
      'pt': 'Deletar',
      'en': 'Delete',
    },
    '8b7lka47': {
      'pt': 'Solicitações',
      'en': 'Requests',
    },
    '7ure9h90': {
      'pt': 'ticket',
      'en': 'ticket',
    },
  },
  // chat_mainAdmin
  {
    '5nux2x5h': {
      'pt': 'Chats',
      'en': 'Chats',
    },
    'd4kugw3g': {
      'pt': 'TextField',
      'en': 'TextField',
    },
    'lbycz30a': {
      'pt': 'Chats',
      'en': 'Chats',
    },
    'ho8xubn9': {
      'pt': 'Teachers',
      'en': 'Teachers',
    },
    'a42prqet': {
      'pt': 'Alertas',
      'en': 'Alerts',
    },
    'tylwbrlk': {
      'pt': '•',
      'en': '•',
    },
  },
  // LocalizacaoLista
  {
    'lonulufh': {
      'pt': 'Endereço',
      'en': 'Address',
    },
    'wrg376ms': {
      'pt': 'Adcione um Endereço:',
      'en': 'Add an Address:',
    },
    'ip5tkrrz': {
      'pt': 'CEP',
      'en': 'CEP',
    },
    'gc9xzd86': {
      'pt': '12345-123',
      'en': '12345-123',
    },
    '9xdmpr6v': {
      'pt': 'CEP invalido!',
      'en': 'Invalid zip code!',
    },
    'j4dvusqo': {
      'pt': 'CEP invalido!',
      'en': 'Invalid zip code!',
    },
    'prb6xq6q': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'q9mid2so': {
      'pt': 'Seu Endereço:',
      'en': 'Your Address:',
    },
    'g87ajn9i': {
      'pt': '•',
      'en': '•',
    },
  },
  // AvailabilityListRequest
  {
    'g2zhj2xf': {
      'pt': 'Aprovado',
      'en': 'Approved',
    },
    'cdv7kn2u': {
      'pt': 'Slack Ltd',
      'en': 'Slack Ltd',
    },
    'm4setkl5': {
      'pt': 'Paid on: May, 4th 2023',
      'en': 'Paid on: May, 4th 2023',
    },
    'j9hiip97': {
      'pt': '\$24.99',
      'en': '\$24.99',
    },
    'xk0wbcu4': {
      'pt': 'DUE',
      'en': 'DUE',
    },
    '5ddw3n11': {
      'pt': 'Rejeitado / Analise',
      'en': 'Rejected / Analyze',
    },
    'ej9fbwc9': {
      'pt': 'Slack Ltd',
      'en': 'Slack Ltd',
    },
    'zyjrzq4n': {
      'pt': 'Paid on: May, 4th 2023',
      'en': 'Paid on: May, 4th 2023',
    },
    '0wnh6ppo': {
      'pt': '\$24.99',
      'en': '\$24.99',
    },
    '6l3tx11f': {
      'pt': 'DUE',
      'en': 'DUE',
    },
    'd1mmcrrv': {
      'pt': 'Teachers',
      'en': 'Teachers',
    },
    '1zv9fmjd': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // AvailableEditCopy
  {
    'edtb3nih': {
      'pt': 'Sua solicitação está:',
      'en': 'Your request is:',
    },
    'suq7hdnj': {
      'pt':
          'Para alterar a disponibilidade, é necessário esperar até que o processo de análise seja concluído.',
      'en':
          'To change availability, you must wait until the analysis process is complete.',
    },
    'pfcxxx12': {
      'pt': '09h',
      'en': '09h',
    },
    '1zm0kf14': {
      'pt': '10h',
      'en': '10am',
    },
    '556q8kig': {
      'pt': '11h',
      'en': '11am',
    },
    'f1f2vn2c': {
      'pt': '13h',
      'en': '13h',
    },
    'ak56wt8t': {
      'pt': '14h',
      'en': '2pm',
    },
    'g0m329gh': {
      'pt': '15h',
      'en': '15h',
    },
    'rknx3dgd': {
      'pt': '16h',
      'en': '4pm',
    },
    '4nrwdoqm': {
      'pt': '17h',
      'en': '5pm',
    },
    'nys4ammn': {
      'pt': '09h',
      'en': '09h',
    },
    '33oz6pis': {
      'pt': '10h',
      'en': '10am',
    },
    'k2vm9do4': {
      'pt': '11h',
      'en': '11am',
    },
    '78cl5axr': {
      'pt': '13h',
      'en': '13h',
    },
    '1wss86qq': {
      'pt': '14h',
      'en': '2pm',
    },
    '5tc4vfzz': {
      'pt': '15h',
      'en': '15h',
    },
    'c2c7cty3': {
      'pt': '16h',
      'en': '4pm',
    },
    'wg3ozpj9': {
      'pt': '17h',
      'en': '5pm',
    },
    '8qicmltm': {
      'pt': 'SEG',
      'en': 'MON',
    },
    'burw6mvw': {
      'pt': 'Horários:',
      'en': 'Schedules:',
    },
    'r0nxvhew': {
      'pt': '09h',
      'en': '09h',
    },
    'icywr1fk': {
      'pt': '10h',
      'en': '10am',
    },
    'gunrdwoj': {
      'pt': '11h',
      'en': '11am',
    },
    'm509lleo': {
      'pt': '13h',
      'en': '13h',
    },
    'qmmwj0by': {
      'pt': '14h',
      'en': '2pm',
    },
    'h8uu77uu': {
      'pt': '15h',
      'en': '15h',
    },
    '1x51gpm2': {
      'pt': '16h',
      'en': '4pm',
    },
    '67l27fgy': {
      'pt': '17h',
      'en': '5pm',
    },
    'tpomang2': {
      'pt': '09h',
      'en': '09h',
    },
    '11fs19su': {
      'pt': '10h',
      'en': '10am',
    },
    'r22fnwsh': {
      'pt': '11h',
      'en': '11am',
    },
    'g1wbn4fy': {
      'pt': '13h',
      'en': '13h',
    },
    '271smed2': {
      'pt': '14h',
      'en': '2pm',
    },
    'th28efzn': {
      'pt': '15h',
      'en': '15h',
    },
    'uy6tnnca': {
      'pt': '16h',
      'en': '4pm',
    },
    '46nb7t16': {
      'pt': '17h',
      'en': '5pm',
    },
    '7loh4hy9': {
      'pt': 'TER',
      'en': 'TO HAVE',
    },
    '7f9cj4ez': {
      'pt': 'Horários:',
      'en': 'Schedules:',
    },
    'pkyur8ap': {
      'pt': '09h',
      'en': '09h',
    },
    '0s5n3pfg': {
      'pt': '10h',
      'en': '10am',
    },
    'w8324jfj': {
      'pt': '11h',
      'en': '11am',
    },
    'us6j7qor': {
      'pt': '13h',
      'en': '13h',
    },
    't3m4v8y8': {
      'pt': '14h',
      'en': '2pm',
    },
    'vzgcdc9a': {
      'pt': '15h',
      'en': '15h',
    },
    '8my6bsr0': {
      'pt': '16h',
      'en': '4pm',
    },
    'uegknpps': {
      'pt': '17h',
      'en': '5pm',
    },
    '9a3so7pv': {
      'pt': '09h',
      'en': '09h',
    },
    '29e414t3': {
      'pt': '10h',
      'en': '10am',
    },
    'kxdktnzs': {
      'pt': '11h',
      'en': '11am',
    },
    'e5xo6trp': {
      'pt': '13h',
      'en': '13h',
    },
    'bpkq8k2v': {
      'pt': '14h',
      'en': '2pm',
    },
    '5ts46efd': {
      'pt': '15h',
      'en': '15h',
    },
    'sfyq9nut': {
      'pt': '16h',
      'en': '4pm',
    },
    'z3gkl2cw': {
      'pt': '17h',
      'en': '5pm',
    },
    'b0ab7apb': {
      'pt': 'QUA',
      'en': 'WED',
    },
    '1e64j7z9': {
      'pt': 'Horários:',
      'en': 'Schedules:',
    },
    'qmu45ppk': {
      'pt': '09h',
      'en': '09h',
    },
    'g5a7g7yg': {
      'pt': '10h',
      'en': '10am',
    },
    'rrgvzv6f': {
      'pt': '11h',
      'en': '11am',
    },
    '1ssr6ih6': {
      'pt': '13h',
      'en': '13h',
    },
    '0gev16s4': {
      'pt': '14h',
      'en': '2pm',
    },
    '3c3lqail': {
      'pt': '15h',
      'en': '15h',
    },
    '99wbwzc5': {
      'pt': '16h',
      'en': '4pm',
    },
    'q5c53gzm': {
      'pt': '17h',
      'en': '5pm',
    },
    '45jly1sv': {
      'pt': '09h',
      'en': '09h',
    },
    'afr4zrcd': {
      'pt': '10h',
      'en': '10am',
    },
    'wmi6lnpw': {
      'pt': '11h',
      'en': '11am',
    },
    'exgtbodi': {
      'pt': '13h',
      'en': '13h',
    },
    'ipvq13pb': {
      'pt': '14h',
      'en': '2pm',
    },
    'js9b54sl': {
      'pt': '15h',
      'en': '15h',
    },
    'sokwjisk': {
      'pt': '16h',
      'en': '4pm',
    },
    '3o1qv733': {
      'pt': '17h',
      'en': '5pm',
    },
    'r9kbekq6': {
      'pt': 'QUI',
      'en': 'THU',
    },
    'sbl8qk4d': {
      'pt': 'Horários:',
      'en': 'Schedules:',
    },
    'diuff0dl': {
      'pt': '09h',
      'en': '09h',
    },
    '9ipnkwoa': {
      'pt': '10h',
      'en': '10am',
    },
    'n5orpzmf': {
      'pt': '11h',
      'en': '11am',
    },
    'mr4pxzin': {
      'pt': '13h',
      'en': '13h',
    },
    'akvdxhh8': {
      'pt': '14h',
      'en': '2pm',
    },
    'g7uh32uf': {
      'pt': '15h',
      'en': '15h',
    },
    'd44a010l': {
      'pt': '16h',
      'en': '4pm',
    },
    'wv8b2cf3': {
      'pt': '17h',
      'en': '5pm',
    },
    'xumyrx02': {
      'pt': '09h',
      'en': '09h',
    },
    'dlt2e74s': {
      'pt': '10h',
      'en': '10am',
    },
    'zh42s2px': {
      'pt': '11h',
      'en': '11am',
    },
    'ulz3ywx3': {
      'pt': '13h',
      'en': '13h',
    },
    '61jk6jsi': {
      'pt': '14h',
      'en': '2pm',
    },
    '7ixpqlav': {
      'pt': '15h',
      'en': '15h',
    },
    '9rvo56ai': {
      'pt': '16h',
      'en': '4pm',
    },
    '8vmvizq7': {
      'pt': '17h',
      'en': '5pm',
    },
    '5sblz4kv': {
      'pt': 'SEX',
      'en': 'FRI',
    },
    'su5qybvp': {
      'pt': 'Solicitar Nova Disponibilidade',
      'en': 'Request New Availability',
    },
    'jt16pydd': {
      'pt': 'Disponibilidade',
      'en': 'Availability',
    },
    'acgcwx29': {
      'pt': '•',
      'en': '•',
    },
  },
  // AvailableEdit
  {
    'kuzo65n9': {
      'pt': 'Observação:',
      'en': 'Observation:',
    },
    'rve0s69i': {
      'pt':
          'Para alterar a disponibilidade, é necessário esperar até que o processo de análise seja concluído.',
      'en':
          'To change availability, you must wait until the analysis process is complete.',
    },
    '3uubdsbj': {
      'pt': 'Deixe uma observação para o Administrador',
      'en': 'Leave a comment for the Administrator',
    },
    '0ts9ej3j': {
      'pt': 'Observação',
      'en': 'Observation',
    },
    'k2b5calg': {
      'pt': 'SEG',
      'en': 'MON',
    },
    '61k7ra16': {
      'pt': 'TER',
      'en': 'TO HAVE',
    },
    'th0uhnyy': {
      'pt': 'QUA',
      'en': 'WED',
    },
    'o8v5aypx': {
      'pt': 'QUI',
      'en': 'THU',
    },
    '11bzgeoq': {
      'pt': 'SEX',
      'en': 'FRI',
    },
    'pig5dw5o': {
      'pt': 'SEG',
      'en': 'MON',
    },
    '43po6mwe': {
      'pt': 'Segunda',
      'en': 'Second',
    },
    'tb57t8ob': {
      'pt': 'até',
      'en': 'until',
    },
    'ip5u5tuf': {
      'pt': 'Area da Aula',
      'en': 'Classroom Area',
    },
    'ds7zvpt0': {
      'pt': 'Terça',
      'en': 'Third',
    },
    'xurgizcj': {
      'pt': 'até',
      'en': 'until',
    },
    'pjsbhfbb': {
      'pt': 'Area da Aula',
      'en': 'Classroom Area',
    },
    'xicrziju': {
      'pt': 'Quarta',
      'en': 'Fourth',
    },
    'cm1eqj1t': {
      'pt': 'até',
      'en': 'until',
    },
    '0wv3v2xj': {
      'pt': 'Area da Aula',
      'en': 'Classroom Area',
    },
    'm3w9qwrm': {
      'pt': 'Quinta',
      'en': 'Fifth',
    },
    'gvbpe91b': {
      'pt': 'até',
      'en': 'until',
    },
    'xsd99mig': {
      'pt': 'Area da Aula',
      'en': 'Classroom Area',
    },
    '388bs0px': {
      'pt': 'Sexta',
      'en': 'Friday',
    },
    '3rs664li': {
      'pt': 'até',
      'en': 'until',
    },
    'gsuzw680': {
      'pt': 'Area da Aula',
      'en': 'Classroom Area',
    },
    'uyour1m9': {
      'pt': 'Continue para visualizar sua Disponibilidade atual',
      'en': 'Continue to view your current availability',
    },
    '19kb7l82': {
      'pt': 'Continuar',
      'en': 'Continue',
    },
    'e362ryas': {
      'pt': 'Solicitar Nova Disponibilidade',
      'en': 'Request New Availability',
    },
    'e49vunf7': {
      'pt': 'Disponibilidade',
      'en': 'Availability',
    },
    '4r4vftun': {
      'pt': '•',
      'en': '•',
    },
  },
  // AvailableEditAdmin
  {
    'b5kybf3i': {
      'pt': 'Segunda',
      'en': 'Second',
    },
    'oi4h49fi': {
      'pt': 'até',
      'en': 'until',
    },
    '6pehko94': {
      'pt': 'Terça',
      'en': 'Third',
    },
    'yix6b8md': {
      'pt': 'até',
      'en': 'until',
    },
    'i10uuxq8': {
      'pt': 'Quarta',
      'en': 'Fourth',
    },
    'gt0pb4yl': {
      'pt': 'até',
      'en': 'until',
    },
    '4zwjmt0t': {
      'pt': 'Quinta',
      'en': 'Fifth',
    },
    'cmutx12m': {
      'pt': 'até',
      'en': 'until',
    },
    'l5ltqpet': {
      'pt': 'Sexta',
      'en': 'Friday',
    },
    'i17qfxzp': {
      'pt': 'até',
      'en': 'until',
    },
    'wrx7fk17': {
      'pt': 'Deixe uma observação para a Teacher',
      'en': 'Leave a comment for the Teacher',
    },
    'mrym2fmb': {
      'pt': 'Observação',
      'en': 'Observation',
    },
    '2ykd2fpl': {
      'pt': 'Rejeitar',
      'en': 'Reject',
    },
    '33nxtz6e': {
      'pt': 'Aprovar',
      'en': 'Approve',
    },
    'p4bqdzrt': {
      'pt': 'Disponibilidade',
      'en': 'Availability',
    },
    'pj1tm5yf': {
      'pt': '•',
      'en': '•',
    },
  },
  // AvailableEditCopy2
  {
    '6z27id4d': {
      'pt': '•',
      'en': '•',
    },
  },
  // PerfilAlunoBilin
  {
    'vkspql8w': {
      'pt': 'Perfil do Aluno',
      'en': 'Student Profile',
    },
    '4wcno2ez': {
      'pt': 'Aulas Pasadas',
      'en': 'Past Classes',
    },
    'jd0gvsle': {
      'pt': 'Presença',
      'en': 'Presence',
    },
    'vp7g97nl': {
      'pt': '•',
      'en': '•',
    },
  },
  // RegistroAulas
  {
    '4sgb55k6': {
      'pt': 'Registro',
      'en': 'Registration',
    },
    'hxk23o86': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // RegistroAulasDetails
  {
    '5hxf166y': {
      'pt': 'Aulas pasadas:',
      'en': 'Past classes:',
    },
    '9psntnq2': {
      'pt': 'Registro',
      'en': 'Registration',
    },
    'an0eyo99': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // PerfilAlunoBilinEdit
  {
    'y7z943i4': {
      'pt': 'Editar Aluno',
      'en': 'Edit Student',
    },
    'a3gbrtv3': {
      'pt': 'Mudar Foto',
      'en': 'Change Photo',
    },
    '5t8nycxo': {
      'pt': 'Nome do Aluno',
      'en': 'Student Name',
    },
    '5ay5kiy8': {
      'pt': 'Nome',
      'en': 'Name',
    },
    'zs2rza6d': {
      'pt': 'Sobrenome do Aluno',
      'en': 'Student\'s Last Name',
    },
    'vgr8qhut': {
      'pt': 'Sobrenome',
      'en': 'Surname',
    },
    'tuhwa93m': {
      'pt': 'Data de nascimento',
      'en': 'Date of birth',
    },
    '07dn11x2': {
      'pt': 'Alergias',
      'en': 'Allergies',
    },
    'qbe252y4': {
      'pt': 'Alguma alergias?',
      'en': 'Any allergies?',
    },
    'sqp9k0ax': {
      'pt': 'Sexo do Aluno?',
      'en': 'Student\'s Gender?',
    },
    'fty1c0gi': {
      'pt': 'Menino',
      'en': 'Boy',
    },
    '6xcwy6f1': {
      'pt': 'Menina',
      'en': 'Girl',
    },
    'ls8cnsik': {
      'pt': 'Aluno vai à Escola?',
      'en': 'Does the student go to school?',
    },
    'cd8bj4h3': {
      'pt': 'Sim',
      'en': 'Yes',
    },
    'zvud3a30': {
      'pt': 'Não',
      'en': 'No',
    },
    'ma775efv': {
      'pt': 'Editar',
      'en': 'Edit',
    },
    'kvzmx0ya': {
      'pt': 'Nome Obrigatório',
      'en': 'Name Required',
    },
    'ntkepuzj': {
      'pt': 'Nome muito curto.',
      'en': 'Name too short.',
    },
    'wop0ddyx': {
      'pt': 'Nome muito longo.',
      'en': 'Name too long.',
    },
    '6zxyv4fx': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '0krxl8q3': {
      'pt': 'Sobrenome Obrigatório',
      'en': 'Last Name Required',
    },
    '8goxbwwg': {
      'pt': 'Nome muito curto.',
      'en': 'Name too short.',
    },
    '7e5waxu5': {
      'pt': 'Nome muito longo.',
      'en': 'Name too long.',
    },
    'bvlwv9xm': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'q0yb0m1i': {
      'pt': 'Obrigatório informar',
      'en': 'Mandatory to inform',
    },
    'bo8sof9c': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'df20d131': {
      'pt': 'Field is required',
      'en': 'Field is required',
    },
    '8s4y2whr': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '7rfpymwc': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // notificationPermision
  {
    '0dnr8at4': {
      'pt': 'Settings Page',
      'en': '',
    },
    'ww1subpv': {
      'pt':
          'Choose what notifcations you want to recieve below and we will update the settings.',
      'en': '',
    },
    'kpq4hwc5': {
      'pt': 'Push Notifications',
      'en': '',
    },
    'wrubfde1': {
      'pt':
          'Receive Push notifications from our application on a semi regular basis.',
      'en': '',
    },
    'u3tl4qiy': {
      'pt': 'Location Services',
      'en': '',
    },
    'lirs6h5s': {
      'pt':
          'Allow us to track your location, this helps keep track of spending and keeps you safe.',
      'en': '',
    },
    'amb7wpmv': {
      'pt': 'Change Changes',
      'en': '',
    },
    'ox9ml683': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // notificationList
  {
    '8fhkzh36': {
      'pt': 'Friend Request',
      'en': '',
    },
    'nso6hr2p': {
      'pt': 'John Smith has requested to be friends.',
      'en': '',
    },
    '2pdclcw9': {
      'pt': '2 hours ago',
      'en': '',
    },
    'n1zt9hrj': {
      'pt': 'Notifications',
      'en': '',
    },
    'bz3efvqq': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // NotificationForm
  {
    '9oyu9qps': {
      'pt': 'Enviar Notificação',
      'en': '',
    },
    'p3x35bvz': {
      'pt': 'Selecionar...',
      'en': '',
    },
    'codstgie': {
      'pt': 'Procurar...',
      'en': '',
    },
    'h09bbix8': {
      'pt': 'Option 1',
      'en': '',
    },
    'rubuu2j9': {
      'pt': 'Option 2',
      'en': '',
    },
    '8g1otlab': {
      'pt': 'Option 3',
      'en': '',
    },
    'ygjtvm5a': {
      'pt': 'Titulo',
      'en': '',
    },
    'cq1w97wt': {
      'pt': 'Mensagem',
      'en': '',
    },
    'gnm1mqnw': {
      'pt': 'Enviar imagem',
      'en': '',
    },
    'tpdizp4f': {
      'pt': 'Enviar',
      'en': '',
    },
    '6631zndj': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // editProfil
  {
    'h8wpr7by': {
      'pt': 'Mudar Foto',
      'en': 'Change Photo',
    },
    'qsjhqi2i': {
      'pt': 'Nome',
      'en': 'Name',
    },
    'z85zmmpd': {
      'pt': 'Nome',
      'en': 'Name',
    },
    'ej45r9ut': {
      'pt': 'Sobrenome',
      'en': 'Surname',
    },
    'pvstf03y': {
      'pt': 'Sobrenome',
      'en': 'Surname',
    },
    'zk4sehf3': {
      'pt': 'CPF',
      'en': 'CPF',
    },
    '9umpeujm': {
      'pt': '123.456.789-01',
      'en': '123.456.789-01',
    },
    '0eflwlc8': {
      'pt': 'Numero de Celular',
      'en': 'Cell phone number',
    },
    'kzoj3gu1': {
      'pt': '(48) 91234-5678',
      'en': '(48) 91234-5678',
    },
    '8eo7b55b': {
      'pt': 'Localização',
      'en': 'Location',
    },
    '9ken16zn': {
      'pt': 'Mudar Senha',
      'en': 'Change Password',
    },
    '5tufv1na': {
      'pt': 'Nome obrigatório',
      'en': 'Name required',
    },
    '82ayu0hi': {
      'pt': 'Nome muito curto',
      'en': 'Name too short',
    },
    '8z3xd2nl': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '4e3slq38': {
      'pt': 'Sobrenome obrigatório',
      'en': 'Last name required',
    },
    '7hzgxaex': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '3pw844cr': {
      'pt': 'CPF obrigatório',
      'en': 'CPF required',
    },
    '2ym46yfu': {
      'pt': 'CFP invalido',
      'en': 'Invalid CFP',
    },
    'ocl9zbrf': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'nzaik775': {
      'pt': 'Celular obrigatório',
      'en': 'Cell phone required',
    },
    'x33r50rp': {
      'pt': 'Celular Invalido',
      'en': 'Invalid Cell Phone',
    },
    '4u26le10': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
  },
  // NavBar
  {
    'dt4arzsf': {
      'pt': 'Home',
      'en': 'Home',
    },
    '7onbq2zt': {
      'pt': 'Mensagens',
      'en': 'Messages',
    },
    '70x8a6is': {
      'pt': 'Mensagens',
      'en': 'Messages',
    },
    'qa07o4di': {
      'pt': 'Perfil',
      'en': 'Profile',
    },
  },
  // PopupUser
  {
    'q7ayfyxu': {
      'pt': 'Editar Perfil',
      'en': 'Edit Profile',
    },
    'admotvnf': {
      'pt': 'Conta',
      'en': 'Account',
    },
    'dtjukcxi': {
      'pt': 'Alterar Permissão:',
      'en': 'Change Permission:',
    },
    'gh5boxj8': {
      'pt': 'Pagamentos',
      'en': 'Payments',
    },
  },
  // PopupUserPermission
  {
    'm7462iaa': {
      'pt': 'Editar Perfil',
      'en': 'Edit Profile',
    },
    'l8shihgr': {
      'pt': 'Admin',
      'en': 'Admin',
    },
    '1mj3jbl9': {
      'pt': 'Teacher',
      'en': 'Teacher',
    },
    'x0r8pkws': {
      'pt': 'Pais',
      'en': 'Country',
    },
  },
  // chat_DetailsOverlay
  {
    'hyv7v1fu': {
      'pt': 'Chat Details',
      'en': 'Chat Details',
    },
    '78cq6z9y': {
      'pt': 'Group Chat ID: ',
      'en': 'Group Chat ID:',
    },
    '550j4mac': {
      'pt': 'In this chat',
      'en': 'In this chat',
    },
    'pzmp29xs': {
      'pt': 'Close',
      'en': 'Close',
    },
  },
  // chat_ThreadComponent
  {
    '5gicdpno': {
      'pt': 'Escreva sua mensagem',
      'en': 'Write your message',
    },
    'xqczwdmn': {
      'pt': 'You must enter a message...',
      'en': 'You must enter a message...',
    },
    '6e4jnpw4': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
  },
  // user_ListSmall
  {
    '40yr3464': {
      'pt': 'ME',
      'en': 'ME',
    },
  },
  // deleteDialog
  {
    '14nrsfn0': {
      'pt': 'Opções',
      'en': 'Options',
    },
    'fqe7sttw': {
      'pt': 'Adcionar/Remover Usuarios',
      'en': 'Add/Remove Users',
    },
    'gi7qvy4k': {
      'pt': 'Deletar converça',
      'en': 'Delete conversation',
    },
    'qi0k28y8': {
      'pt': 'Confirme para Deletar',
      'en': 'Confirm to Delete',
    },
    'kjs7gcii': {
      'pt': 'Você vai Deletar Permanente a coversa',
      'en': 'You will Permanently Delete the conversation',
    },
    'cvr8na48': {
      'pt': 'Deletar',
      'en': 'Delete',
    },
  },
  // empty_Agendamento
  {
    'a7upuih7': {
      'pt': 'Sem Agendamentos',
      'en': 'No Appointments',
    },
    '0jej3m05': {
      'pt': 'Você não tem aulas! Solicite aulas Bilin para seu filho.',
      'en': 'You don\'t have classes! Request Bilin classes for your child.',
    },
  },
  // user_List
  {
    'q2l3e3u0': {
      'pt': 'Close',
      'en': 'Close',
    },
  },
  // editProfilDashboard
  {
    'gtu3cask': {
      'pt': 'Atualize seu Perfil',
      'en': 'Update your Profile',
    },
    'o9oa9ckf': {
      'pt': 'Mudar Foto',
      'en': 'Change Photo',
    },
    'jjetogqt': {
      'pt': 'Nome Completo',
      'en': 'Full Name',
    },
    'o7nrb7a6': {
      'pt': 'Your full name...',
      'en': 'Your full name...',
    },
    'epa1f9cm': {
      'pt': 'Descrição',
      'en': 'Description',
    },
    'uojd4g9j': {
      'pt': 'Descrição',
      'en': 'Description',
    },
    'atybmltd': {
      'pt': 'Opções',
      'en': 'Options',
    },
    '1rh5mdo1': {
      'pt': 'Deletar Conta',
      'en': 'Delete Account',
    },
    'wkzvok4f': {
      'pt': 'Confirme para Deletar',
      'en': 'Confirm to Delete',
    },
    'hycrlbcg': {
      'pt': 'Deletar',
      'en': 'Delete',
    },
    '8lplwuo9': {
      'pt': 'Save Changes',
      'en': 'Save Changes',
    },
  },
  // user_ListStudent
  {
    'dg91xh6q': {
      'pt': 'Assign User',
      'en': 'Assign User',
    },
    '2yhnx05a': {
      'pt': 'Select a user from the list below to continue.',
      'en': 'Select a user from the list below to continue.',
    },
    'z882ytm6': {
      'pt': 'Close',
      'en': 'Close',
    },
  },
  // user_ListTeacher
  {
    's2gh3u74': {
      'pt': 'Teachers',
      'en': 'Teachers',
    },
    'mj2bxepw': {
      'pt': 'Clique em uma teacher abaixo.',
      'en': 'Click on a teacher below.',
    },
    '3mj94mfg': {
      'pt': 'Cancelar',
      'en': 'Cancel',
    },
  },
  // PresencaCard
  {
    'g689a35o': {
      'pt': 'Miss',
      'en': 'Miss',
    },
  },
  // Location
  {
    'slf9am09': {
      'pt': 'Endereço:',
      'en': 'Address:',
    },
    'tnvz7blt': {
      'pt': 'Titulo',
      'en': 'Title',
    },
    'zdtm30mf': {
      'pt': 'Minha Casa',
      'en': 'My house',
    },
    'f0im1cdc': {
      'pt': 'Rua',
      'en': 'Road',
    },
    'y6721kj2': {
      'pt': 'Rua',
      'en': 'Road',
    },
    'bjzupv4d': {
      'pt': 'Numero',
      'en': 'Number',
    },
    '26o06hyp': {
      'pt': 'Numero',
      'en': 'Number',
    },
    '21vg71f3': {
      'pt': 'Unid. Apt.',
      'en': 'Apt. Unit.',
    },
    'q2tb3axs': {
      'pt': 'Apt. 104',
      'en': 'Apt. 104',
    },
    'uz4jvbpi': {
      'pt': 'Bairro',
      'en': 'Neighborhood',
    },
    'h8uhy7z7': {
      'pt': 'Bairro',
      'en': 'Neighborhood',
    },
    'wqtflukk': {
      'pt': 'Cidade',
      'en': 'City',
    },
    '7vc2szy4': {
      'pt': 'Cidade',
      'en': 'City',
    },
    '1f3c6ic6': {
      'pt': 'Estado',
      'en': 'State',
    },
    'xvdkddjx': {
      'pt': 'Estado',
      'en': 'State',
    },
    'z8nmh51j': {
      'pt': 'Salvar',
      'en': 'Save',
    },
    'bkud2lww': {
      'pt': 'Campo Obrigatório',
      'en': 'Mandatory Field',
    },
    'asu0gc6g': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'extt5wi7': {
      'pt': 'Campo Obrigatório',
      'en': 'Mandatory Field',
    },
    'l7s9nx3r': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'uxpg7hn7': {
      'pt': 'Campo Obrigatório',
      'en': 'Mandatory Field',
    },
    'bw0dmddo': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'u6bf3bup': {
      'pt': 'Field is required',
      'en': 'Field is required',
    },
    'q1h9ve9p': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'ifn6xnfo': {
      'pt': 'Campo Obrigatório',
      'en': 'Mandatory Field',
    },
    'quhxjixa': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '68xh6772': {
      'pt': 'Campo Obrigatório',
      'en': 'Mandatory Field',
    },
    'gkp6ygll': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'ah5tsyhx': {
      'pt': 'Campo Obrigatório',
      'en': 'Mandatory Field',
    },
    'vvs1lvat': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
  },
  // listaLocalizacao
  {
    'rk780ha1': {
      'pt': 'Padrão',
      'en': 'Standard',
    },
  },
  // EmailValidation
  {
    'g0qcq5js': {
      'pt': 'E-mail de Verificação!',
      'en': 'Verification Email!',
    },
    'a12nlrk6': {
      'pt':
          'Por favor, valide seu e-mail para continuar. Enviamos um link de verificação para o seu endereço de e-mail. Caso não encontre, verifique sua pasta de spam ou tente reenviar.',
      'en':
          'Please validate your email to continue. We\'ve sent a verification link to your email address. If you can\'t find it, check your spam folder or try resending.',
    },
    'kd60es2m': {
      'pt': 'Enviar',
      'en': 'To send',
    },
    'oyyrwawj': {
      'pt': 'Enviado',
      'en': 'Sent',
    },
  },
  // LocationDelete
  {
    'wfw11jt6': {
      'pt': 'Endereço:',
      'en': 'Address:',
    },
    'crdg0jiv': {
      'pt': 'Titulo: ',
      'en': 'Title:',
    },
    'bsb6li20': {
      'pt': 'Rua: ',
      'en': 'Road:',
    },
    'i59ia3on': {
      'pt': 'N#: ',
      'en': 'N#:',
    },
    'wegw25y3': {
      'pt': 'Bairro: ',
      'en': 'Neighborhood:',
    },
    '1oaexgnv': {
      'pt': 'Estado: ',
      'en': 'State:',
    },
    'i13ckym4': {
      'pt': 'CEP: ',
      'en': 'ZIP Code:',
    },
    'imvs4feo': {
      'pt': 'Deletar',
      'en': 'Delete',
    },
  },
  // local
  {
    'vk4bd60g': {
      'pt': 'Adcione um Endereço:',
      'en': 'Add an Address:',
    },
    'ji7hf9yp': {
      'pt': 'CEP',
      'en': 'CEP',
    },
    '4eeski51': {
      'pt': '12345-123',
      'en': '12345-123',
    },
    '2m3yuzwv': {
      'pt': 'CEP invalido!',
      'en': 'Invalid zip code!',
    },
    'uw0eud96': {
      'pt': 'CEP invalido!',
      'en': 'Invalid zip code!',
    },
    'f1k8d4ql': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '385b1v50': {
      'pt': 'Seu Endereço:',
      'en': 'Your Address:',
    },
    'gjgshyrb': {
      'pt': 'Cancelar',
      'en': 'Cancel',
    },
  },
  // DisponibilidadeComp
  {
    'omoi3453': {
      'pt': 'Criar Sua Aula Bilin',
      'en': 'Create Your Bilin Class',
    },
    'vvt0vlab': {
      'pt': 'Inglês',
      'en': 'English',
    },
    'rg2v3v9j': {
      'pt': 'Espanhol',
      'en': 'Spanish',
    },
    'h5egt3um': {
      'pt': 'Francês',
      'en': 'French',
    },
    'tjgfzt6c': {
      'pt': 'Low',
      'en': 'Low',
    },
    'fg6aq2ia': {
      'pt': 'Inglês',
      'en': 'English',
    },
    '1bo5y37r': {
      'pt': 'idade minima',
      'en': 'minimum age',
    },
    'cpnfsxl7': {
      'pt': 'idade maxíma',
      'en': 'maximum age',
    },
    'p8ni06qb': {
      'pt': 'Tempo maxímo de deslocamento:',
      'en': 'Maximum travel time:',
    },
    'm9zkrjt6': {
      'pt': '15 min',
      'en': '15 min',
    },
    'kkleoqjx': {
      'pt': '30 min',
      'en': '30 min',
    },
    'z3xxubam': {
      'pt': '45 min',
      'en': '45 min',
    },
    'bl4b6uzw': {
      'pt': '1 hora',
      'en': '1 hour',
    },
    'y4blp05c': {
      'pt': 'Deixe um recado para o Administrador',
      'en': 'Leave a message for the Administrator',
    },
    'kzfxd4zs': {
      'pt': 'Recado',
      'en': 'Message',
    },
    'vaivfbfk': {
      'pt': 'Criar minha Disponibilidade',
      'en': 'Create my Availability',
    },
  },
  // RequestParents
  {
    'yhiikv8x': {
      'pt': 'Novas Solicitações',
      'en': 'New Requests',
    },
    'zd0171rj': {
      'pt': 'Arquivar',
      'en': 'Archive',
    },
    'ejypfr8l': {
      'pt': 'Arquivados',
      'en': 'Archived',
    },
    'hr710j6p': {
      'pt': 'Deletar',
      'en': 'Delete',
    },
  },
  // requestParentsTitle
  {
    'bc0wbbzb': {
      'pt': 'Solicitações de Pais',
      'en': 'Parent Requests',
    },
  },
  // calendarTime
  {
    '62uj8s74': {
      'pt': 'Selecionar',
      'en': 'Select',
    },
  },
  // Horarios
  {
    'p0thk61x': {
      'pt': 'SEG',
      'en': 'MON',
    },
    'wl574frf': {
      'pt': 'TER',
      'en': 'TO HAVE',
    },
    'twyk279y': {
      'pt': 'QUA',
      'en': 'WED',
    },
    'j57yrv3g': {
      'pt': 'QUI',
      'en': 'THU',
    },
    'epb7etwz': {
      'pt': 'SEX',
      'en': 'FRI',
    },
    'owzuryuo': {
      'pt': 'SEG',
      'en': 'MON',
    },
    'f79fqsux': {
      'pt': 'Segunda',
      'en': 'Second',
    },
    't851m2xo': {
      'pt': 'até',
      'en': 'until',
    },
    'pmf3bmc5': {
      'pt': 'Area da Aula',
      'en': 'Classroom Area',
    },
    'chs9kjxm': {
      'pt': 'Selecione o local da aula nesse dia',
      'en': 'Select the location of the class on that day',
    },
    'y1hewe15': {
      'pt': 'Terça',
      'en': 'Third',
    },
    'kga5t7ar': {
      'pt': 'até',
      'en': 'until',
    },
    'y8ee4si2': {
      'pt': 'Area da Aula',
      'en': 'Classroom Area',
    },
    'enrztdf3': {
      'pt': 'Selecione o local da aula nesse dia',
      'en': 'Select the location of the class on that day',
    },
    '1sfe47td': {
      'pt': 'Quarta',
      'en': 'Fourth',
    },
    'pkqo8ed9': {
      'pt': 'até',
      'en': 'until',
    },
    'hwguxmzh': {
      'pt': 'Area da Aula',
      'en': 'Classroom Area',
    },
    'bkkw8e9l': {
      'pt': 'Selecione o local da aula nesse dia',
      'en': 'Select the location of the class on that day',
    },
    '2csdktlm': {
      'pt': 'Quinta',
      'en': 'Fifth',
    },
    'u5fgr2ha': {
      'pt': 'até',
      'en': 'until',
    },
    'pa833eye': {
      'pt': 'Area da Aula',
      'en': 'Classroom Area',
    },
    'f3vb07yw': {
      'pt': 'Selecione o local da aula nesse dia',
      'en': 'Select the location of the class on that day',
    },
    'tzsw4me1': {
      'pt': 'Sexta',
      'en': 'Friday',
    },
    '8wluqhgy': {
      'pt': 'até',
      'en': 'until',
    },
    '4u6k5lww': {
      'pt': 'Area da Aula',
      'en': 'Classroom Area',
    },
    'p8pglzis': {
      'pt': 'Selecione o local da aula nesse dia',
      'en': 'Select the location of the class on that day',
    },
  },
  // HorariosStudent
  {
    'hlar78ws': {
      'pt': 'SEG',
      'en': 'MON',
    },
    'd7fz0y0a': {
      'pt': 'TER',
      'en': 'TO HAVE',
    },
    '2o6ccl7n': {
      'pt': 'QUA',
      'en': 'WED',
    },
    'j4f1y3uh': {
      'pt': 'QUI',
      'en': 'THU',
    },
    'prlda0g9': {
      'pt': 'SEX',
      'en': 'FRI',
    },
    '91ty0n50': {
      'pt': 'SEG',
      'en': 'MON',
    },
    'yygzgpap': {
      'pt': 'Segunda',
      'en': 'Second',
    },
    'gv3xgyed': {
      'pt': 'até',
      'en': 'until',
    },
    'lzvtu6tl': {
      'pt': 'Terça',
      'en': 'Third',
    },
    'xuq12z15': {
      'pt': 'até',
      'en': 'until',
    },
    '5ecut3tv': {
      'pt': 'Quarta',
      'en': 'Fourth',
    },
    'jgk4h4hw': {
      'pt': 'até',
      'en': 'until',
    },
    'cppjxvre': {
      'pt': 'Quinta',
      'en': 'Fifth',
    },
    'or391urn': {
      'pt': 'até',
      'en': 'until',
    },
    'y4vxbpw2': {
      'pt': 'Sexta',
      'en': 'Friday',
    },
    '74ceuu4q': {
      'pt': 'até',
      'en': 'until',
    },
  },
  // itineario1
  {
    '1c6yeip1': {
      'pt': 'Intervalo longo',
      'en': 'Long interval',
    },
  },
  // agendamentoBookingAdmin
  {
    'bkhhm5w4': {
      'pt': 'Teacher:',
      'en': 'Teacher:',
    },
    'g4w3u972': {
      'pt': 'Adicione uma Teacher',
      'en': 'Add a Teacher',
    },
    '7ene1755': {
      'pt': 'Escolha a Teacher',
      'en': 'Choose a Teacher',
    },
    'lv8hwkb0': {
      'pt': 'Horários diaponiveis do estudante:',
      'en': 'Student available times:',
    },
    'sa0cvg67': {
      'pt': 'Distâcia:',
      'en': 'Distance:',
    },
    'z966fk0n': {
      'pt': 'SEG',
      'en': 'MON',
    },
    '22us4e5d': {
      'pt': 'TER',
      'en': 'TO HAVE',
    },
    'gpzrxla4': {
      'pt': 'QUA',
      'en': 'WED',
    },
    '8debvgxs': {
      'pt': 'QUI',
      'en': 'THU',
    },
    'dmzh4ykt': {
      'pt': 'SEX',
      'en': 'FRI',
    },
    'cvq88kid': {
      'pt': 'SEG',
      'en': 'MON',
    },
    'emfprprf': {
      'pt': 'SEG - Horários já marcados:',
      'en': 'MON - Times already scheduled:',
    },
    'acpjxw69': {
      'pt': 'Selecionado',
      'en': 'Selected',
    },
    'o4j3vp07': {
      'pt': 'Selecionado',
      'en': 'Selected',
    },
    'id060zpe': {
      'pt': 'Horários disponiveis:',
      'en': 'Available times:',
    },
    '3k6xpx8h': {
      'pt': 'Tempo entre aulas maior que desejado',
      'en': 'Time between classes longer than desired',
    },
    'fp00fbbi': {
      'pt': 'Cancelar',
      'en': 'Cancel',
    },
    'qual4586': {
      'pt': 'Agendar',
      'en': 'To schedule',
    },
  },
  // StudentPopup
  {
    'b6jiwyxy': {
      'pt': 'Fechar',
      'en': 'To close',
    },
  },
  // AlunoBilinMain
  {
    'uz592l8e': {
      'pt': 'anos',
      'en': 'years',
    },
    'uoub6t4e': {
      'pt': 'Idade:',
      'en': 'Age:',
    },
    'oz1rk06z': {
      'pt': 'Escola:',
      'en': 'School:',
    },
    'djm5h6es': {
      'pt': 'Alergia:',
      'en': 'Allergy:',
    },
    '1bfjx2ve': {
      'pt': 'Proxíma Aula Bilin:',
      'en': 'Next Bilin Class:',
    },
    'z0uralat': {
      'pt': 'Localização',
      'en': 'Location',
    },
  },
  // loginImages
  {
    '2jatalg7': {
      'pt': 'De infancia\nà Bilingue',
      'en': 'From childhood\nto bilingual',
    },
  },
  // AgendarmentoPais
  {
    '25bl1ajb': {
      'pt': 'Inglês',
      'en': 'English',
    },
    'x0qjywlz': {
      'pt': 'Espanhol',
      'en': 'Spanish',
    },
    'ifggifqb': {
      'pt': 'Francês',
      'en': 'French',
    },
    '20dlppo8': {
      'pt': 'Low',
      'en': 'Low',
    },
    'vpo5jt3y': {
      'pt': 'Inglês',
      'en': 'English',
    },
    'zgz00mrx': {
      'pt': 'Adicionar',
      'en': 'To add',
    },
    'gqaevh57': {
      'pt': 'Escolha o Filho(a):',
      'en': 'Choose the Child:',
    },
    '9g0yy7ry': {
      'pt': 'Dias de interese:',
      'en': 'Days of interest:',
    },
    '33v366vd': {
      'pt': 'Escolha a localização',
      'en': 'Choose location',
    },
    'ejh6rfmk': {
      'pt': 'Selecione o local da(s) aula(s)',
      'en': 'Select the location of the class(es)',
    },
    'od3udtzg': {
      'pt': 'Enviar Solicitação',
      'en': 'Submit Request',
    },
  },
  // RegistroAulasFeedback
  {
    'scvmfio4': {
      'pt': 'Feedback',
      'en': 'Feedback',
    },
    'o6m6g47k': {
      'pt': 'Escreva um feedback',
      'en': 'Write a feedback',
    },
  },
  // SolicitacaoPaisBTN
  {
    'utu4xuhx': {
      'pt': 'Solicitações de Pais',
      'en': 'Parent Requests',
    },
  },
  // DisponibilidadesBTN
  {
    'z6cz0jzi': {
      'pt': 'Dispo. Teachers',
      'en': 'Teachers\' Dispo.',
    },
  },
  // FeedbackComp
  {
    '4gseyv9o': {
      'pt': 'Feedback:',
      'en': 'Feedback:',
    },
  },
  // Miscellaneous
  {
    '4absiq3t': {
      'pt': 'Permita o acesso à câmera para tirar fotos ou vídeos.',
      'en': 'Allow access to the camera to take photos or videos.',
    },
    'bw3xvqvj': {
      'pt': 'Permita o acesso à sua biblioteca de fotos para enviar imagens.',
      'en': 'Allow access to your photo library to upload images.',
    },
    '473xso0a': {
      'pt': '',
      'en':
          'In order to record audio for video, this app requires permission to access the microphone.',
    },
    '8jnqwgew': {
      'pt': 'Use biometria para proteger sua conta.',
      'en': 'Use biometrics to protect your account.',
    },
    '37of50mf': {
      'pt': 'Permita o acesso ao calendário para agendar eventos.',
      'en': 'Allow calendar access to schedule events.',
    },
    '7d0e4m9r': {
      'pt': 'Receba notificações importantes deste app.',
      'en': 'Receive important notifications from this app.',
    },
    'mfk0rc90': {
      'pt': 'Permita usar sua localização.',
      'en': 'Allow to use your location.',
    },
    's37qxdli': {
      'pt': 'Erro: [erro]',
      'en': 'Error: [error]',
    },
    '2z816su4': {
      'pt': 'E-mail de redefinição enviado!',
      'en': 'Reset email sent!',
    },
    'mglvkt51': {
      'pt': 'E-mail obrigatório!',
      'en': 'Email required!',
    },
    '01r1fhu8': {
      'pt': 'Número de telefone obrigatório, deve começar com +.',
      'en': 'Phone number required, must start with +.',
    },
    'njwxvmc3': {
      'pt': 'As senhas não coincidem.',
      'en': 'Passwords do not match.',
    },
    'm4vundge': {
      'pt': 'Insira o código de verificação SMS.',
      'en': 'Enter the SMS verification code.',
    },
    'sg1x42l4': {
      'pt': 'Sessão expirada. Faça login novamente antes de excluir a conta.',
      'en':
          'Session expired. Please log in again before deleting your account.',
    },
    'dqtq53dq': {
      'pt':
          'Sessão expirada. Faça login novamente antes de atualizar o e-mail.',
      'en': 'Session expired. Please log in again before updating your email.',
    },
    '0vuw0eum': {
      'pt': 'E-mail de confirmação de alteração enviado!',
      'en': 'Change confirmation email sent!',
    },
    'v0t492dk': {
      'pt': 'E-mail já está em uso.',
      'en': 'Email is already in use.',
    },
    'utw91pnf': {
      'pt': 'Credenciais inválidas ou expiradas.',
      'en': 'Invalid or expired credentials.',
    },
    's2r2lgcm': {
      'pt': 'Formato de arquivo inválido.',
      'en': 'Invalid file format.',
    },
    'w1szhndu': {
      'pt': 'Carregando arquivo...',
      'en': 'Loading file...',
    },
    '5jgpo09l': {
      'pt': 'Sucesso!',
      'en': 'Success!',
    },
    '9eea0a1o': {
      'pt': 'Falha no upload.',
      'en': 'Upload failed.',
    },
    's6z6k5wt': {
      'pt': '',
      'en': '',
    },
    'r6ckm65c': {
      'pt': '',
      'en': '',
    },
    'p8b1owjm': {
      'pt': '',
      'en': '',
    },
    'fdi41w9h': {
      'pt': '',
      'en': '',
    },
    'ejpm3ou6': {
      'pt': '',
      'en': '',
    },
    'ay3pa9l0': {
      'pt': '',
      'en': '',
    },
    'ffljld27': {
      'pt': '',
      'en': '',
    },
    'kir50ysy': {
      'pt': '',
      'en': '',
    },
    'irtdcldu': {
      'pt': '',
      'en': '',
    },
    '4rgiyv34': {
      'pt': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
