/// Torii Mobile - Core UI Widgets
/// 
/// Minimalist, zen-inspired UI components for a Japanese learning platform.
/// Import this single file instead of individual component files.
/// 
/// Usage:
/// ```dart
/// import 'package:torii_app/core/widgets/widgets.dart';
/// ```
library;

// Cards
export 'cards/glass_card.dart';
export 'cards/elevated_card.dart';
export 'cards/gradient_card.dart';
export 'cards/minimal_card.dart' hide ElevatedCard;

// Badges
export 'badges/app_badge.dart';

// Stats
export 'stats/stat_card.dart';

// Progress
export 'progress/progress_bar.dart';

// Loading
export 'loading/shimmer_loading.dart';
export 'loading/app_loading.dart';

// States
export 'states/empty_state.dart';

// Dividers
export 'dividers/section_divider.dart';

// Animations
export 'animations/entry_animation.dart';
export 'animations/voice_wave_animation.dart';

// Shell
export 'app_shell.dart';

// Buttons
export 'buttons/app_button.dart';

// Inputs
export 'inputs/app_text_field.dart';

// Background
export 'app_background.dart';


// Payments
export 'payments/payment_qr_card.dart';

// Course
export 'course/course_progress_ring.dart';
