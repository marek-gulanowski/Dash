/* Converted to D from ../include/capi/cef_stream_capi.h by htod */
module cef_stream_capi;
// Copyright (c) 2014 Marshall A. Greenblatt. All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are
// met:
//
//    * Redistributions of source code must retain the above copyright
// notice, this list of conditions and the following disclaimer.
//    * Redistributions in binary form must reproduce the above
// copyright notice, this list of conditions and the following disclaimer
// in the documentation and/or other materials provided with the
// distribution.
//    * Neither the name of Google Inc. nor the name Chromium Embedded
// Framework nor the names of its contributors may be used to endorse
// or promote products derived from this software without specific prior
// written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
// ---------------------------------------------------------------------------
//
// This file was generated by the CEF translator tool and should not edited
// by hand. See the translator.README.txt file in the tools directory for
// more information.
//

//C     #ifndef CEF_INCLUDE_CAPI_CEF_STREAM_CAPI_H_
//C     #define CEF_INCLUDE_CAPI_CEF_STREAM_CAPI_H_
//C     #pragma once

//C     #include "include/capi/cef_base_capi.h"
import cef_base_capi;

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif


///
// Structure the client can implement to provide a custom stream reader. The
// functions of this structure may be called on any thread.
///
//C     typedef struct _cef_read_handler_t {
  ///
  // Base structure.
  ///
//C       cef_base_t base;

  ///
  // Read raw binary data.
  ///
//C       size_t (CEF_CALLBACK *read)(struct _cef_read_handler_t* self, void* ptr,
//C           size_t size, size_t n);

  ///
  // Seek to the specified offset position. |whence| may be any one of SEEK_CUR,
  // SEEK_END or SEEK_SET. Return zero on success and non-zero on failure.
  ///
//C       int (CEF_CALLBACK *seek)(struct _cef_read_handler_t* self, int64 offset,
//C           int whence);

  ///
  // Return the current offset position.
  ///
//C       int64 (CEF_CALLBACK *tell)(struct _cef_read_handler_t* self);

  ///
  // Return non-zero if at end of file.
  ///
//C       int (CEF_CALLBACK *eof)(struct _cef_read_handler_t* self);

  ///
  // Return true (1) if this handler performs work like accessing the file
  // system which may block. Used as a hint for determining the thread to access
  // the handler from.
  ///
//C       int (CEF_CALLBACK *may_block)(struct _cef_read_handler_t* self);
//C     } cef_read_handler_t;
struct _cef_read_handler_t
{
    cef_base_t base;
    size_t  function(_cef_read_handler_t *self, void *ptr, size_t size, size_t n)read;
    int  function(_cef_read_handler_t *self, int64 offset, int whence)seek;
    int64  function(_cef_read_handler_t *self)tell;
    int  function(_cef_read_handler_t *self)eof;
    int  function(_cef_read_handler_t *self)may_block;
}
extern (C):
alias _cef_read_handler_t cef_read_handler_t;


///
// Structure used to read data from a stream. The functions of this structure
// may be called on any thread.
///
//C     typedef struct _cef_stream_reader_t {
  ///
  // Base structure.
  ///
//C       cef_base_t base;

  ///
  // Read raw binary data.
  ///
//C       size_t (CEF_CALLBACK *read)(struct _cef_stream_reader_t* self, void* ptr,
//C           size_t size, size_t n);

  ///
  // Seek to the specified offset position. |whence| may be any one of SEEK_CUR,
  // SEEK_END or SEEK_SET. Returns zero on success and non-zero on failure.
  ///
//C       int (CEF_CALLBACK *seek)(struct _cef_stream_reader_t* self, int64 offset,
//C           int whence);

  ///
  // Return the current offset position.
  ///
//C       int64 (CEF_CALLBACK *tell)(struct _cef_stream_reader_t* self);

  ///
  // Return non-zero if at end of file.
  ///
//C       int (CEF_CALLBACK *eof)(struct _cef_stream_reader_t* self);

  ///
  // Returns true (1) if this reader performs work like accessing the file
  // system which may block. Used as a hint for determining the thread to access
  // the reader from.
  ///
//C       int (CEF_CALLBACK *may_block)(struct _cef_stream_reader_t* self);
//C     } cef_stream_reader_t;
struct _cef_stream_reader_t
{
    cef_base_t base;
    size_t  function(_cef_stream_reader_t *self, void *ptr, size_t size, size_t n)read;
    int  function(_cef_stream_reader_t *self, int64 offset, int whence)seek;
    int64  function(_cef_stream_reader_t *self)tell;
    int  function(_cef_stream_reader_t *self)eof;
    int  function(_cef_stream_reader_t *self)may_block;
}
alias _cef_stream_reader_t cef_stream_reader_t;


///
// Create a new cef_stream_reader_t object from a file.
///
//C     CEF_EXPORT cef_stream_reader_t* cef_stream_reader_create_for_file(
//C         const cef_string_t* fileName);
cef_stream_reader_t * cef_stream_reader_create_for_file(cef_string_t *fileName);

///
// Create a new cef_stream_reader_t object from data.
///
//C     CEF_EXPORT cef_stream_reader_t* cef_stream_reader_create_for_data(void* data,
//C         size_t size);
cef_stream_reader_t * cef_stream_reader_create_for_data(void *data, size_t size);

///
// Create a new cef_stream_reader_t object from a custom handler.
///
//C     CEF_EXPORT cef_stream_reader_t* cef_stream_reader_create_for_handler(
//C         cef_read_handler_t* handler);
cef_stream_reader_t * cef_stream_reader_create_for_handler(cef_read_handler_t *handler);


///
// Structure the client can implement to provide a custom stream writer. The
// functions of this structure may be called on any thread.
///
//C     typedef struct _cef_write_handler_t {
  ///
  // Base structure.
  ///
//C       cef_base_t base;

  ///
  // Write raw binary data.
  ///
//C       size_t (CEF_CALLBACK *write)(struct _cef_write_handler_t* self,
//C           const void* ptr, size_t size, size_t n);

  ///
  // Seek to the specified offset position. |whence| may be any one of SEEK_CUR,
  // SEEK_END or SEEK_SET. Return zero on success and non-zero on failure.
  ///
//C       int (CEF_CALLBACK *seek)(struct _cef_write_handler_t* self, int64 offset,
//C           int whence);

  ///
  // Return the current offset position.
  ///
//C       int64 (CEF_CALLBACK *tell)(struct _cef_write_handler_t* self);

  ///
  // Flush the stream.
  ///
//C       int (CEF_CALLBACK *flush)(struct _cef_write_handler_t* self);

  ///
  // Return true (1) if this handler performs work like accessing the file
  // system which may block. Used as a hint for determining the thread to access
  // the handler from.
  ///
//C       int (CEF_CALLBACK *may_block)(struct _cef_write_handler_t* self);
//C     } cef_write_handler_t;
struct _cef_write_handler_t
{
    cef_base_t base;
    size_t  function(_cef_write_handler_t *self, void *ptr, size_t size, size_t n)write;
    int  function(_cef_write_handler_t *self, int64 offset, int whence)seek;
    int64  function(_cef_write_handler_t *self)tell;
    int  function(_cef_write_handler_t *self)flush;
    int  function(_cef_write_handler_t *self)may_block;
}
alias _cef_write_handler_t cef_write_handler_t;


///
// Structure used to write data to a stream. The functions of this structure may
// be called on any thread.
///
//C     typedef struct _cef_stream_writer_t {
  ///
  // Base structure.
  ///
//C       cef_base_t base;

  ///
  // Write raw binary data.
  ///
//C       size_t (CEF_CALLBACK *write)(struct _cef_stream_writer_t* self,
//C           const void* ptr, size_t size, size_t n);

  ///
  // Seek to the specified offset position. |whence| may be any one of SEEK_CUR,
  // SEEK_END or SEEK_SET. Returns zero on success and non-zero on failure.
  ///
//C       int (CEF_CALLBACK *seek)(struct _cef_stream_writer_t* self, int64 offset,
//C           int whence);

  ///
  // Return the current offset position.
  ///
//C       int64 (CEF_CALLBACK *tell)(struct _cef_stream_writer_t* self);

  ///
  // Flush the stream.
  ///
//C       int (CEF_CALLBACK *flush)(struct _cef_stream_writer_t* self);

  ///
  // Returns true (1) if this writer performs work like accessing the file
  // system which may block. Used as a hint for determining the thread to access
  // the writer from.
  ///
//C       int (CEF_CALLBACK *may_block)(struct _cef_stream_writer_t* self);
//C     } cef_stream_writer_t;
struct _cef_stream_writer_t
{
    cef_base_t base;
    size_t  function(_cef_stream_writer_t *self, void *ptr, size_t size, size_t n)write;
    int  function(_cef_stream_writer_t *self, int64 offset, int whence)seek;
    int64  function(_cef_stream_writer_t *self)tell;
    int  function(_cef_stream_writer_t *self)flush;
    int  function(_cef_stream_writer_t *self)may_block;
}
alias _cef_stream_writer_t cef_stream_writer_t;


///
// Create a new cef_stream_writer_t object for a file.
///
//C     CEF_EXPORT cef_stream_writer_t* cef_stream_writer_create_for_file(
//C         const cef_string_t* fileName);
cef_stream_writer_t * cef_stream_writer_create_for_file(cef_string_t *fileName);

///
// Create a new cef_stream_writer_t object for a custom handler.
///
//C     CEF_EXPORT cef_stream_writer_t* cef_stream_writer_create_for_handler(
//C         cef_write_handler_t* handler);
cef_stream_writer_t * cef_stream_writer_create_for_handler(cef_write_handler_t *handler);


//C     #ifdef __cplusplus
//C     }
//C     #endif

//C     #endif  // CEF_INCLUDE_CAPI_CEF_STREAM_CAPI_H_
