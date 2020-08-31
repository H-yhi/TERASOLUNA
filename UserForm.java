package com.example.sample.app.validation;

import java.io.Serializable;

import javax.validation.constraints.Email;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class UserForm implements Serializable {

  private static final long serialVersionUID = 1L;

  @NotNull // (1)
  @Size(min = 1, max = 20) // (2)
  private String name;

  @NotNull
  @Size(min = 1, max = 50)
  @Email // (3)
  private String email;

  @NotNull // (4)
  @Min(0) // (5)
  @Max(200) // (6)
  private Integer age;

  @NotNull
  @Size(min = 1, max = 3) // (7)
  @Valid
  private List<AddressForm> addresses;

  // omitted setter/getter
}

/*
(1)対象のフィールドがnullでないことを示すjavax.validation.constraints.NotNullを付ける。
Spring MVCでは、文字列の入力フィールドに未入力の状態でフォームを送信した場合、
デフォルトではフォームオブジェクトにnullではなく、空文字がバインドされる。
この@NotNullは、そもそもリクエストパラメータとしてnameが存在することをチェックする。
*/

/*
(2)対象のフィールドの文字列長(またはコレクションのサイズ)が指定したサイズの範囲内にあることを示すjavax.validation.constraints.Sizeを付ける。
上記の通り、Spring MVCではデフォルトで、未入力の文字列フィールドには、空文字がバインドされるため、
1文字以上というルールが入力必須を表す。
*/

/*
(3)対象のフィールドがE-mail形式であることを示すjavax.validation.constraints.Emailを付ける。
E-mail形式の要件が@Email のチェックと合致しない場合は、javax.validation.constraints.Patternを用いて、正規表現を指定する必要がある。
*/

/*
(4)数値の入力フィールドに未入力の状態でフォームを送信した場合、フォームオブジェクトにnull がバインドされるため、@NotNullがageの入力必須条件を表す。
*/

/*
(5)対象のフィールドが指定した数値の以上であることを示すjavax.validation.constraints.Minを付ける。
*/

/*
(6)対象のフィールドが指定した数値の以下であることを示すjavax.validation.constraints.Maxを付ける。
*/

/*
(7)コレクションのサイズチェックにも、@Sizeアノテーションを使用できる。
*/
