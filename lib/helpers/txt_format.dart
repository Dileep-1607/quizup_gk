
/// For Text format ///
txt(String text){
 String f = text.replaceAll("_", " ");
    String result = f[0].toUpperCase() + f.substring(1);
    return result;
}