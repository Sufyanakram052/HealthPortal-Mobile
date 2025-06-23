import 'package:get/get.dart';

class InvoiceController extends GetxController {
  late Invoice invoice;

  @override
  void onInit() {
    super.onInit();
    loadInvoice();
  }

  void loadInvoice() {
    // In a real app, this would come from a repository
    invoice = Invoice(
      invoiceNumber: 'INV-2024-0223',
      invoiceDate: DateTime(2024, 2, 23),
      doctor: Doctor(
        name: 'Dr. Sarah Johnson',
        specialty: 'Cardiologist',
        address: '123 Medical Center Drive, Suite 456',
        phone: '+1 (555) 123-4567',
        email: 'dr.johnson@mediclinic.com',
      ),
      patient: Patient(
        name: 'John Smith',
        patientId: 'PAT-2024-0589',
      ),
      visitDate: DateTime(2024, 2, 23),
      paymentMethod: 'Credit Card',
      items: [
        InvoiceItem(
          description: 'Consultation',
          quantity: 1,
          amount: 150.00,
        ),
        InvoiceItem(
          description: 'ECG Test',
          quantity: 1,
          amount: 75.00,
        ),
      ],
    );
  }
}

///common model
class Invoice {
  final String invoiceNumber;
  final DateTime invoiceDate;
  final Doctor doctor;
  final Patient patient;
  final DateTime visitDate;
  final String paymentMethod;
  final List<InvoiceItem> items;
  final double vatPercentage;
  final double discountPercentage;

  Invoice({
    required this.invoiceNumber,
    required this.invoiceDate,
    required this.doctor,
    required this.patient,
    required this.visitDate,
    required this.paymentMethod,
    required this.items,
    this.vatPercentage = 5.0,
    this.discountPercentage = 10.0,
  });

  double get subtotal => items.fold(0, (sum, item) => sum + (item.amount * item.quantity));

  double get vatAmount => subtotal * vatPercentage / 100;

  double get discountAmount => subtotal * discountPercentage / 100;

  double get totalAmount => subtotal + vatAmount - discountAmount;
}

class Doctor {
  final String name;
  final String specialty;
  final String address;
  final String phone;
  final String email;

  Doctor({
    required this.name,
    required this.specialty,
    required this.address,
    required this.phone,
    required this.email,
  });
}

class Patient {
  final String name;
  final String patientId;

  Patient({required this.name, required this.patientId});
}

class InvoiceItem {
  final String description;
  final int quantity;
  final double amount;

  InvoiceItem({
    required this.description,
    required this.quantity,
    required this.amount,
  });
}