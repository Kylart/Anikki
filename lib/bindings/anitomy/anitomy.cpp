#include <iostream>

#include <string>
#include <vector>
#include <locale>
#include <codecvt>

#include "helpers.h"

#include "src/anitomy/anitomy.h"

int main()
{
  return 0;
}

extern "C" void *get_anitomy(char *str)
{
  std::wstring to_parse = transform_string(str);

  anitomy::Anitomy *anitomy = new anitomy::Anitomy();
  anitomy->Parse(to_parse);

  return anitomy;
}

extern "C" void destroy_anitomy (void *ptr) {
  auto typed_ptr = static_cast<anitomy::Anitomy *>(ptr);
  delete typed_ptr;
}

extern "C" char *get_title (void *ptr) {
  auto typed_ptr = static_cast<anitomy::Anitomy *>(ptr);

  const auto &elements = typed_ptr->elements();
  const auto anitomy_title = elements.get(anitomy::kElementAnimeTitle);

  return to_string(anitomy_title);
}

extern "C" char *get_episode (void *ptr) {
  auto typed_ptr = static_cast<anitomy::Anitomy *>(ptr);

  const auto &elements = typed_ptr->elements();
  const auto anitomy_episode = elements.get(anitomy::kElementEpisodeNumber);

  return to_string(anitomy_episode);
}

extern "C" char *get_release_group (void *ptr) {
  auto typed_ptr = static_cast<anitomy::Anitomy *>(ptr);

  const auto &elements = typed_ptr->elements();
  const auto anitomy_release_group = elements.get(anitomy::kElementReleaseGroup);

  return to_string(anitomy_release_group);
}