#include "helpers.h"

std::wstring transform_string (char * str) {
  std::wstring to_parse;
  size_t length = strlen(str);
  to_parse.reserve(length);

  for (size_t i = 0; i < length; i++) {
    to_parse.push_back(str[i] & 0xFF);
  }

  return to_parse;
}

/**
 * From https://stackoverflow.com/a/4387335
*/
char * to_string (anitomy::string_t str) {
  std::wstring ws_value(str.c_str());
  
  const wchar_t *input = ws_value.c_str();

  // Count required buffer size (plus one for null-terminator).
  size_t size = (wcslen(input) + 1) * sizeof(wchar_t);
  char *buffer = new char[size];

  #ifdef __STDC_LIB_EXT1__
      // wcstombs_s is only guaranteed to be available if __STDC_LIB_EXT1__ is defined
      size_t convertedSize;
      std::wcstombs_s(&convertedSize, buffer, size, input, size);
  #else
      std::wcstombs(buffer, input, size);
  #endif

  /* Use the string stored in "buffer" variable */
  return buffer;

  delete buffer;
}