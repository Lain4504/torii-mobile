import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/course.dart';
import '../../viewmodels/course_view_model.dart';
import '../../viewmodels/auth_view_model.dart';
import '../../views/auth/login_screen.dart';
import 'widgets/course_form.dart';

class CourseView extends StatefulWidget {
  const CourseView({super.key});

  @override
  State<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  int? editingId;
  final titleCtrl = TextEditingController();
  final descCtrl = TextEditingController();
  final priceCtrl = TextEditingController(text: '0');
  bool published = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CourseViewModel>().load();
    });
  }

  @override
  void dispose() {
    titleCtrl.dispose();
    descCtrl.dispose();
    priceCtrl.dispose();
    super.dispose();
  }

  void _resetForm() {
    setState(() {
      editingId = null;
      titleCtrl.clear();
      descCtrl.clear();
      priceCtrl.text = '0';
      published = false;
    });
  }

  bool _validateForm(BuildContext context) {
    if (titleCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Title không được để trống')),
      );
      return false;
    }
    final parsedPrice = double.tryParse(priceCtrl.text);
    if (parsedPrice == null || parsedPrice < 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Price không hợp lệ')),
      );
      return false;
    }
    return true;
  }

  Future<void> _handleLogout() async {
    final authViewModel = context.read<AuthViewModel>();
    
    // Show confirmation dialog
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Đăng xuất'),
        content: const Text('Bạn có chắc chắn muốn đăng xuất?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Đăng xuất'),
          ),
        ],
      ),
    );

    if (confirm != true || !mounted) return;

    // Perform logout
    await authViewModel.logout();

    if (!mounted) return;

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Đăng xuất thành công!'),
        backgroundColor: Colors.green,
      ),
    );

    // Navigate to LoginScreen
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CourseViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Đăng xuất',
            onPressed: _handleLogout,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CourseForm(
              editingId: editingId,
              titleCtrl: titleCtrl,
              descCtrl: descCtrl,
              priceCtrl: priceCtrl,
              published: published,
              onPublishedChanged: (v) => setState(() => published = v),
              onReset: _resetForm,
            ),
            const SizedBox(height: 16),
            if (vm.listError != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  vm.listError!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            Expanded(
              child: vm.isLoadingList
                  ? const Center(child: CircularProgressIndicator())
                  : RefreshIndicator(
                      onRefresh: () => vm.load(),
                      child: vm.courses.isEmpty
                          ? ListView(
                              children: const [
                                SizedBox(height: 120),
                                Center(child: Text('Chưa có khoá học nào')),
                              ],
                            )
                          : ListView.builder(
                              itemCount: vm.courses.length,
                              itemBuilder: (context, index) {
                                final c = vm.courses[index];
                                final deleting = vm.deletingId == c.id;
                                return ListTile(
                                  title: Text(c.title),
                                  subtitle: Text(
                                    'Price: \$${c.price} • Published: ${c.published}',
                                  ),
                                  onTap: () {
                                    setState(() {
                                      editingId = c.id;
                                      titleCtrl.text = c.title;
                                      descCtrl.text = c.description ?? '';
                                      priceCtrl.text = '${c.price}';
                                      published = c.published;
                                    });
                                  },
                                  trailing: IconButton(
                                    icon: deleting
                                        ? const SizedBox(
                                            height: 16,
                                            width: 16,
                                            child:
                                                CircularProgressIndicator(strokeWidth: 2),
                                          )
                                        : const Icon(Icons.delete_outline),
                                    onPressed: (vm.isSubmitting || deleting)
                                        ? null
                                        : () async {
                                            await vm.remove(c.id);
                                            if (editingId == c.id) _resetForm();
                                          },
                                  ),
                                );
                              },
                            ),
                    ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: vm.isSubmitting
                    ? null
                    : () async {
                        if (!_validateForm(context)) return;

                        final inputCreate = CreateCourseInput(
                          title: titleCtrl.text.trim(),
                          description:
                              descCtrl.text.trim().isEmpty ? null : descCtrl.text.trim(),
                          price: double.tryParse(priceCtrl.text) ?? 0,
                          published: published,
                        );
                        final inputUpdate = UpdateCourseInput(
                          title: titleCtrl.text.trim(),
                          description:
                              descCtrl.text.trim().isEmpty ? null : descCtrl.text.trim(),
                          price: double.tryParse(priceCtrl.text) ?? 0,
                          published: published,
                        );

                        if (editingId == null) {
                          await vm.create(inputCreate);
                        } else {
                          await vm.update(editingId!, inputUpdate);
                        }
                        if (!context.mounted) return;
                        if (vm.actionError == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                editingId == null
                                    ? 'Created course'
                                    : 'Updated course',
                              ),
                            ),
                          );
                          _resetForm();
                        }
                      },
                child: Text(editingId == null ? 'Create' : 'Update'),
              ),
            ),
            if (vm.actionError != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  vm.actionError!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}


