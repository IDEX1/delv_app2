import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../models/meal.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime(2025, 2, 1);
  DateTime? _selectedDay;
  final Map<DateTime, Meal> _meals = {};
  bool _isDailyView = false; // Initialement sur Weekly View

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;

    // Repas visibles sur l'image
    _meals[DateTime.utc(2025, 2, 12)] = Meal(
      name: 'Salade',
      description: 'Salade César',
      imageUrl: 'assets/salad.jpg',
      rating: 4.5,
      time: '12:30',
    );

    _meals[DateTime.utc(2025, 2, 19)] = Meal(
      name: 'Pizza',
      description: 'Pizza Margherita',
      imageUrl: 'assets/pizza.jpg',
      rating: 4.0,
      time: '19:00',
    );

    _meals[DateTime.utc(2025, 2, 24)] = Meal(
      name: 'Poulet',
      description: 'Poulet rôti',
      imageUrl: 'assets/chicken.jpg',
      rating: 4.0,
      time: '19:00',
    );

    _meals[DateTime.utc(2025, 2, 26)] = Meal(
      name: 'Pâtes',
      description: 'Pâtes à la carbonara',
      imageUrl: 'assets/pasta.jpg',
      rating: 4.0,
      time: '19:00',
    );
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
  }

  void _previousMonth() {
    setState(() {
      _focusedDay = DateTime(_focusedDay.year, _focusedDay.month - 1, 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _focusedDay = DateTime(_focusedDay.year, _focusedDay.month + 1, 1);
    });
  }

  String _getMonthName(int month) {
    const monthNames = [
      '',
      'Janvier',
      'Février',
      'Mars',
      'Avril',
      'Mai',
      'Juin',
      'Juillet',
      'Août',
      'Septembre',
      'Octobre',
      'Novembre',
      'Décembre',
    ];
    return monthNames[month];
  }

  void _navigateToFavoritesAndAddMeal() async {
    Meal? selectedMeal = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FavoritesScreen()),
    );

    if (selectedMeal != null && _selectedDay != null) {
      setState(() {
        final normalizedDate = DateTime.utc(
          _selectedDay!.year,
          _selectedDay!.month,
          _selectedDay!.day,
        );
        _meals[normalizedDate] = selectedMeal;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF5E5),
      body: SafeArea(
        child: Column(
          children: [
            // En-tête avec logo à gauche et titre
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Row(
                children: [
                  // Logo à gauche
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[600],
                      image: const DecorationImage(
                        image: AssetImage('assets/profil.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFB9E7AD), // Couleur demandée
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 4,
                              offset: Offset(0, 2),
                              spreadRadius: -2, // Pour créer un "inner shadow"
                            ),
                          ],
                        ),
                        child: Text(
                          'Calender',
                          style: GoogleFonts.elMessiri(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF4A8B3A),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Espace pour équilibrer le logo
                  const SizedBox(width: 40),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Onglets Daily View / Weekly View modifiés selon vos spécifications
            Container(
              width: 230, // Largeur spécifiée
              height: 56, // Hauteur spécifiée
              decoration: BoxDecoration(
                color: Color(0xFFF5F1E8), // Couleur de fond demandée
                borderRadius: BorderRadius.circular(28), // Coins très arrondis
                border: Border.all(
                  color: Color(0xFFE0E0E0),
                ), // Stroke comme demandé
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isDailyView = true;
                        });
                      },
                      child: Container(
                        width: 100, // Largeur de l'onglet
                        height: 36, // Hauteur de l'onglet
                        decoration: BoxDecoration(
                          color:
                              _isDailyView ? Colors.white : Color(0xFFF5F1E8),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Center(
                          child: Text(
                            'Daily View',
                            style: GoogleFonts.elMessiri(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color:
                                  _isDailyView
                                      ? Colors.black
                                      : Color(0xFF979797),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isDailyView = false;
                        });
                      },
                      child: Container(
                        width: 100, // Largeur de l'onglet
                        height: 36, // Hauteur de l'onglet
                        decoration: BoxDecoration(
                          color:
                              !_isDailyView ? Colors.white : Color(0xFFF5F1E8),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Center(
                          child: Text(
                            'Weekly View',
                            style: GoogleFonts.elMessiri(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color:
                                  !_isDailyView
                                      ? Colors.black
                                      : Color(0xFF979797),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Navigation du mois avec sort left et sort right (sans "Calendrier des repas")
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Centré
                children: [
                  InkWell(
                    onTap: _previousMonth,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      child: Icon(Icons.sort, size: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      '${_getMonthName(_focusedDay.month)} ${_focusedDay.year}',
                      style: GoogleFonts.elMessiri(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: _nextMonth,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      child: Transform.rotate(
                        angle: 3.14159, // 180 degrés en radians
                        child: Icon(Icons.sort, size: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Calendrier - Utiliser Expanded pour qu'il prenne tout l'espace disponible
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TableCalendar(
                  firstDay: DateTime.utc(2024, 1, 1),
                  lastDay: DateTime.utc(2026, 12, 31),
                  focusedDay: _focusedDay,
                  calendarFormat: _calendarFormat,
                  availableCalendarFormats: const {
                    CalendarFormat.month: 'Month',
                  },
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: _onDaySelected,
                  onPageChanged: (focusedDay) {
                    setState(() {
                      _focusedDay = focusedDay;
                    });
                  },
                  headerVisible: false, // On gère le header manuellement
                  calendarStyle: CalendarStyle(
                    outsideDaysVisible: true, // Afficher les jours hors du mois
                    cellMargin: const EdgeInsets.all(2),
                    cellPadding: EdgeInsets.zero,
                    defaultTextStyle: TextStyle(fontSize: 12),
                  ),
                  daysOfWeekHeight: 40,
                  rowHeight:
                      60, // Légèrement plus grand pour éviter les débordements
                  daysOfWeekStyle: DaysOfWeekStyle(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    weekdayStyle: GoogleFonts.elMessiri(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    weekendStyle: GoogleFonts.elMessiri(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  calendarBuilders: CalendarBuilders(
                    defaultBuilder: (context, day, focusedDay) {
                      return _buildDayCell(day);
                    },
                    todayBuilder: (context, day, focusedDay) {
                      return _buildDayCell(day);
                    },
                    selectedBuilder: (context, day, focusedDay) {
                      return _buildDayCell(day, isSelected: true);
                    },
                    outsideBuilder: (context, day, focusedDay) {
                      // Afficher les jours hors du mois avec un style grisé
                      return _buildDayCell(day, isOutside: true);
                    },
                    dowBuilder: (context, day) {
                      const weekdayNames = [
                        'LUN',
                        'MAR',
                        'MER',
                        'JEU',
                        'VEN',
                        'SAM',
                        'DIM',
                      ];
                      final weekdayIndex = day.weekday - 1;

                      return Container(
                        margin: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: Center(
                          child: Text(
                            weekdayNames[weekdayIndex],
                            style: GoogleFonts.elMessiri(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            
          ],
        ),
      ),
    );
  }

  // Cellule de jour modifiée pour éviter les débordements
  Widget _buildDayCell(
    DateTime day, {
    bool isSelected = false,
    bool isOutside = false,
  }) {
    final normalizedDate = DateTime.utc(day.year, day.month, day.day);
    final meal = _meals[normalizedDate];

    return Container(
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(6),
        color:
            isSelected
                ? Color(0xFF82CE70)
                : (isOutside ? Colors.grey[100] : Colors.white),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Text(
            '${day.day}',
            style: GoogleFonts.elMessiri(
              fontWeight: FontWeight.bold,
              fontSize: 11,
              color:
                  isSelected
                      ? Colors.white
                      : (isOutside ? Colors.grey : Colors.black),
            ),
          ),
          SizedBox(height: 2),
          // Repas ou bouton Ajouter
          if (meal != null)
            Expanded(
              child: Container(
                constraints: BoxConstraints(maxHeight: 34),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 16,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFD969),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Icon(
                        Icons.restaurant,
                        size: 12,
                        color: Colors.amber[800],
                      ),
                    ),
                    SizedBox(height: 1),
                    Flexible(
                      child: Text(
                        meal.name,
                        style: GoogleFonts.elMessiri(
                          fontSize: 8,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            Expanded(
              child: Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _selectedDay = day;
                    });
                    _navigateToFavoritesAndAddMeal();
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    '+ Ajouter',
                    style: GoogleFonts.elMessiri(
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                      color:
                          isSelected
                              ? Colors.white
                              : (isOutside ? Colors.grey[400] : Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes Repas Favoris', style: GoogleFonts.elMessiri()),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Meal favoriteMeal = Meal(
              name: 'Pizza', // Raccourci pour éviter le débordement
              description: 'Tomate, mozzarella, basilic',
              imageUrl: 'assets/pizza.jpg',
              rating: 4.0,
              time: '19:00',
            );
            Navigator.pop(context, favoriteMeal);
          },
          child: Text('Choisir ce repas', style: GoogleFonts.elMessiri()),
        ),
      ),
    );
  }
}
