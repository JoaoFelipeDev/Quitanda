import 'package:flutter/material.dart';
import 'package:quitanda/src/pages/auth/sign_in_screen.dart';
import 'package:quitanda/src/pages/common_widgets/custom_text_field.dart';
import 'package:quitanda/src/config/app_data.dart' as appData;

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do usuário'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) {
                return const SignInScreen();
              }));
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          CustomTextField(
            readOnly: true,
            initialValue: appData.user.email,
            icon: Icons.email,
            label: 'Email',
          ),
          CustomTextField(
            readOnly: true,
            initialValue: appData.user.nome,
            icon: Icons.person,
            label: 'Nome',
          ),
          CustomTextField(
            readOnly: true,
            initialValue: appData.user.celular,
            icon: Icons.phone,
            label: 'Celular',
          ),
          CustomTextField(
            readOnly: true,
            initialValue: appData.user.cpf,
            icon: Icons.file_copy,
            label: 'CPF',
            isSecret: true,
          ),
          SizedBox(
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.green),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () {
                updatePassword();
              },
              child: const Text('Atualizar senha'),
            ),
          )
        ],
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          'Atualização de senha',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const CustomTextField(
                          icon: Icons.lock,
                          label: 'Senha atual',
                          isSecret: true),
                      const CustomTextField(
                        icon: Icons.lock_clock_outlined,
                        label: 'Nova senha',
                        isSecret: true,
                      ),
                      const CustomTextField(
                          icon: Icons.lock_clock_outlined,
                          label: 'Confirmar nova senha',
                          isSecret: true),
                      SizedBox(
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text('Atualizar'),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
