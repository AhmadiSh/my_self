// ignore_for_file: constant_identifier_names

class ResponseModel<T> {
  late Status status;
  late T data;
  late String message;

  ResponseModel.loading(this.message) : status = Status.Loading;
  ResponseModel.completed(this.data) : status = Status.Completed;

 @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { Loading, Completed,  }
