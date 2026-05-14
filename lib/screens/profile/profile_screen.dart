import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_colors.dart';
import '../../providers/user_provider.dart';

class ProfileScreen extends StatefulWidget {

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() =>
      _ProfileScreenState();
}

class _ProfileScreenState
    extends State<ProfileScreen> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {

      context
          .read<UserProvider>()
          .loadUser();
    });
  }

  @override
  Widget build(BuildContext context) {

    final userProvider =
        context.watch<UserProvider>();

    final user = userProvider.user;

    if (userProvider.isLoading || user == null) {

      return const Scaffold(

        body: Center(
          child:
              CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(

      appBar: AppBar(
        title: const Text('Mi Perfil'),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            CircleAvatar(

              radius: 50,

              backgroundImage:
                  NetworkImage(
                user.imageUrl,
              ),
            ),

            const SizedBox(height: 16),

            Text(

              user.name,

              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              user.email,
            ),

            const SizedBox(height: 24),

            _sectionTitle('Objetivo'),

            const SizedBox(height: 12),

            Container(

              width: double.infinity,

              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(

                color: AppColors.primary
                    .withOpacity(0.1),

                borderRadius:
                    BorderRadius.circular(16),
              ),

              child: Row(

                children: [

                  const Icon(
                    Icons.fitness_center,
                    color: AppColors.primary,
                  ),

                  const SizedBox(width: 12),

                  Text(

                    user.goal,

                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            _sectionTitle(
              'Resumen nutricional',
            ),

            const SizedBox(height: 16),

            Row(

              children: [

                Expanded(

                  child: _nutritionCard(
                    '${user.caloriesGoal}',
                    'Calorías',
                    Icons
                        .local_fire_department,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(

                  child: _nutritionCard(
                    '${user.proteinGoal}g',
                    'Proteína',
                    Icons.egg,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(

              children: [

                Expanded(

                  child: _nutritionCard(
                    '${user.carbsGoal}g',
                    'Carbs',
                    Icons.rice_bowl,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(

                  child: _nutritionCard(
                    '${user.fatGoal}g',
                    'Grasas',
                    Icons.water_drop,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {

    return Align(

      alignment: Alignment.centerLeft,

      child: Text(

        title,

        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _nutritionCard(
    String value,
    String label,
    IconData icon,
  ) {

    return Container(

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius:
            BorderRadius.circular(16),

        boxShadow: [

          BoxShadow(
            color:
                Colors.black.withOpacity(0.05),
            blurRadius: 6,
          ),
        ],
      ),

      child: Column(

        children: [

          Icon(
            icon,
            size: 32,
            color: AppColors.primary,
          ),

          const SizedBox(height: 12),

          Text(

            value,

            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          Text(label),
        ],
      ),
    );
  }
}