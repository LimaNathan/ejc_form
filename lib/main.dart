import 'package:flutter/material.dart';
import 'package:form_ejc/data/repositories/form_repository.dart';
import 'package:form_ejc/domain/repositories/i_form_repository.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'presentation/viewmodels/form_viewmodel.dart';
import 'presentation/views/form_view.dart';

void main() async {
  const supabaseURL = String.fromEnvironment('supabase_url');
  const supabaseKey = String.fromEnvironment('supabase_anon_key');

  await Supabase.initialize(
    anonKey: supabaseKey,
    url: supabaseURL,
  );
  runApp(const EjcFormApp());
}

class EjcFormApp extends StatelessWidget {
  const EjcFormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp(
      title: 'EJC Form',
      theme: ShadThemeData(
        brightness: Brightness.light,
        colorScheme: const ShadRoseColorScheme.light(),
      ),
      home: MultiProvider(
        providers: [
          Provider<IFormRepository>(
            create: (_) => FormRepository(
                supabaseClient: Supabase //
                    .instance
                    .client),
          ),
          ChangeNotifierProvider(
            create: (context) => FormViewModel(
              formRepository: context.read<IFormRepository>(),
            ),
          ),
        ],
        child: const FormView(),
      ),
    );
  }
}
