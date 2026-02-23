import 'package:ecommerce/theme/theme.dart';
import 'package:flutter/material.dart';

class ChooseLanguageScreen extends StatefulWidget {
	const ChooseLanguageScreen({
		super.key,
		this.initialLanguage = 'English',
	});

	final String initialLanguage;

	static const List<String> allLanguages = [
		'Abkhaz',
		'Afar',
		'Afrikaans',
		'Akan',
		'Albanian',
		'Amharic',
		'Arabic',
		'Aragonese',
		'Armenian',
		'Assamese',
		'Avaric',
		'Avestan',
		'Aymara',
		'Azerbaijani',
		'Bambara',
		'Bashkir',
		'Basque',
		'Belarusian',
		'Bengali',
		'Bihari',
		'Bislama',
		'Bosnian',
		'Breton',
		'Bulgarian',
		'Burmese',
		'Catalan',
		'Chamorro',
		'Chechen',
		'Chichewa',
		'Chinese',
		'Chuvash',
		'Cornish',
		'Corsican',
		'Cree',
		'Croatian',
		'Czech',
		'Danish',
		'Divehi',
		'Dutch',
		'Dzongkha',
		'English',
		'Esperanto',
		'Estonian',
		'Ewe',
		'Faroese',
		'Fijian',
		'Finnish',
		'French',
		'Fulah',
		'Galician',
		'Georgian',
		'German',
		'Greek',
		'Guarani',
		'Gujarati',
		'Haitian Creole',
		'Hausa',
		'Hebrew',
		'Herero',
		'Hindi',
		'Hiri Motu',
		'Hungarian',
		'Icelandic',
		'Ido',
		'Igbo',
		'Indonesian',
		'Interlingua',
		'Interlingue',
		'Inuktitut',
		'Inupiaq',
		'Irish',
		'Italian',
		'Japanese',
		'Javanese',
		'Kalaallisut',
		'Kannada',
		'Kanuri',
		'Kashmiri',
		'Kazakh',
		'Khmer',
		'Kikuyu',
		'Kinyarwanda',
		'Kirghiz',
		'Komi',
		'Kongo',
		'Korean',
		'Kurdish',
		'Kwanyama',
		'Lao',
		'Latin',
		'Latvian',
		'Limburgish',
		'Lingala',
		'Lithuanian',
		'Luba-Katanga',
		'Luxembourgish',
		'Macedonian',
		'Malagasy',
		'Malay',
		'Malayalam',
		'Maltese',
		'Manx',
		'Maori',
		'Marathi',
		'Marshallese',
		'Mongolian',
		'Nauru',
		'Navajo',
		'Ndonga',
		'Nepali',
		'North Ndebele',
		'Northern Sami',
		'Norwegian',
		'Norwegian Bokmal',
		'Norwegian Nynorsk',
		'Occitan',
		'Ojibwe',
		'Oriya',
		'Oromo',
		'Ossetian',
		'Pali',
		'Pashto',
		'Persian',
		'Polish',
		'Portuguese',
		'Punjabi',
		'Quechua',
		'Romanian',
		'Romansh',
		'Russian',
		'Samoan',
		'Sango',
		'Sanskrit',
		'Sardinian',
		'Scottish Gaelic',
		'Serbian',
		'Shona',
		'Sindhi',
		'Sinhala',
		'Slovak',
		'Slovenian',
		'Somali',
		'South Ndebele',
		'Southern Sotho',
		'Spanish',
		'Sundanese',
		'Swahili',
		'Swati',
		'Swedish',
		'Tagalog',
		'Tahitian',
		'Tajik',
		'Tamil',
		'Tatar',
		'Telugu',
		'Thai',
		'Tibetan',
		'Tigrinya',
		'Tonga',
		'Tsonga',
		'Tswana',
		'Turkish',
		'Turkmen',
		'Twi',
		'Uighur',
		'Ukrainian',
		'Urdu',
		'Uzbek',
		'Venda',
		'Vietnamese',
		'Volapuk',
		'Walloon',
		'Welsh',
		'Western Frisian',
		'Wolof',
		'Xhosa',
		'Yiddish',
		'Yoruba',
		'Zhuang',
		'Zulu',
	];

	@override
	State<ChooseLanguageScreen> createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
	late String _selectedLanguage;

	@override
	void initState() {
		super.initState();
		_selectedLanguage = widget.initialLanguage;
	}

	@override
	Widget build(BuildContext context) {
		final isDark = Theme.of(context).brightness == Brightness.dark;
		final cardColor = isDark ? const Color(0xFF1E293B) : Colors.white;
		final titleColor = isDark ? Colors.white : AppTheme.textPrimary;
		final subtitleColor = isDark ? Colors.white70 : AppTheme.textSecondary;
		final dividerColor = isDark ? Colors.white12 : Colors.black12;

		return Scaffold(
			backgroundColor: Theme.of(context).scaffoldBackgroundColor,
			appBar: AppBar(
				title: const Text('Choose Language'),
				centerTitle: true,
				elevation: 0,
			),
			body: Padding(
				padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
				child: Column(
					children: [
						Container(
							padding: const EdgeInsets.all(14),
							decoration: BoxDecoration(
								color: cardColor,
								borderRadius: BorderRadius.circular(14),
							),
							child: Row(
								children: [
									Icon(Icons.language, color: AppTheme.primaryColor),
									const SizedBox(width: 10),
									Expanded(
										child: Text(
											'Default language is English',
											style: TextStyle(
												color: subtitleColor,
												fontSize: 14,
											),
										),
									),
								],
							),
						),
						const SizedBox(height: 12),
						Expanded(
							child: Container(
								decoration: BoxDecoration(
									color: cardColor,
									borderRadius: BorderRadius.circular(14),
								),
								child: ListView.separated(
									itemCount: ChooseLanguageScreen.allLanguages.length,
									separatorBuilder: (_, __) => Divider(
										height: 1,
										color: dividerColor,
									),
									itemBuilder: (context, index) {
										final language = ChooseLanguageScreen.allLanguages[index];
										return RadioListTile<String>(
											value: language,
											groupValue: _selectedLanguage,
											activeColor: AppTheme.primaryColor,
											title: Text(
												language,
												style: TextStyle(
													color: titleColor,
													fontWeight: FontWeight.w500,
												),
											),
											onChanged: (value) {
												if (value == null) {
													return;
												}
												setState(() {
													_selectedLanguage = value;
												});
											},
										);
									},
								),
							),
						),
						const SizedBox(height: 12),
						SizedBox(
							width: double.infinity,
							child: ElevatedButton(
								onPressed: () {
									Navigator.pop(context, _selectedLanguage);
								},
								style: ElevatedButton.styleFrom(
									backgroundColor: AppTheme.primaryColor,
									foregroundColor: Colors.white,
									padding: const EdgeInsets.symmetric(vertical: 14),
									shape: RoundedRectangleBorder(
										borderRadius: BorderRadius.circular(12),
									),
								),
								child: const Text(
									'Save Language',
									style: TextStyle(
										fontWeight: FontWeight.w600,
										fontSize: 15,
									),
								),
							),
						),
					],
				),
			),
		);
	}
}
